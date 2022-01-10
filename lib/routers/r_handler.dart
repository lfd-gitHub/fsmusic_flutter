import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/routers/utils.dart';
import 'package:fsmusic_flutter/utils/fsm_log.dart';

typedef Interceptor = Future<bool> Function(Uri uri);
typedef PageBuilder = Widget Function(
  BuildContext context, [
  Map<String, String>? pArgs,
  Map<String, String>? args,
]);

class RPage {
  String name;
  PageBuilder builder;
  RPage({
    required this.name,
    required this.builder,
  });

  @override
  String toString() => 'RPage(name: $name)';
}

class RInfo {
  Uri uri;
  Completer completer;
  RInfo({
    required this.uri,
  }) : completer = Completer();
}

class RParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(routeInformation.location ?? "/");
  }

  @override
  RouteInformation? restoreRouteInformation(String configuration) {
    return RouteInformation(location: configuration);
  }
}

typedef PageGenerator = Widget Function(BuildContext context, Uri uri);

class RDelegate extends RouterDelegate<String> with PopNavigatorRouterDelegateMixin<String>, ChangeNotifier {
  static const sTag = "RDelegate";
  final _stack = <RInfo>[];
  final PageGenerator generator;
  final List<Interceptor>? interceptors;

  RDelegate(this.generator, [this.interceptors]);

  static RDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is RDelegate, 'Delegate type must match');
    return delegate as RDelegate;
  }

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  String? get currentConfiguration => _stack.isNotEmpty ? _stack.last.uri.toString() : null;

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    FsmLog.d(sTag, "_onPopPage ${route.settings}");
    if (route.didPop(result)) {
      _stack.removeLast().completer.complete(result);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<dynamic> toUri(Uri uri, {bool replace = false, String? untilRouterName}) async {
    FsmLog.d(sTag, "toUri[replace = $replace urn = $untilRouterName] $uri");
    var info = RInfo(uri: uri);
    if (interceptors?.isNotEmpty == true) {
      for (var it in interceptors!) {
        bool intercept = await it(uri);
        if (intercept) {
          return;
        }
      }
    }
    if (replace) {
      _stack.removeLast().completer.complete(null);
    } else if (untilRouterName != null) {
      _removeUntil(untilRouterName);
    }
    _stack.add(info);
    notifyListeners();
    return await info.completer.future;
  }

  void _removeUntil(String untilRouterName) {
    var idx = _stack.indexWhere((e) => matchedUriAndRName(untilRouterName, e.uri));
    if (idx > 0) {
      int len = _stack.length;
      for (var i = idx; i < len; i++) {
        _stack.removeLast().completer.complete(null);
      }
    }
  }

  void pop([dynamic result, String? popUntilRouteName]) {
    if (popUntilRouteName != null) {
      _removeUntil(popUntilRouteName);
      notifyListeners();
      return;
    }
    if (_stack.isNotEmpty) {
      _stack.removeLast().completer.complete(result);
      notifyListeners();
      return;
    }
    assert(_stack.isEmpty, "stack is empty!");
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: _stack.map((e) {
        return MaterialPage(
          child: generator(context, e.uri),
        );
      }).toList(),
      onGenerateRoute: (settings) {
        FsmLog.d(sTag, "onGenerateRoute - ${settings.name}");
      },
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) {
    _stack
      ..clear()
      ..add(RInfo(uri: Uri.parse(configuration)));
    return SynchronousFuture(null);
  }
}
