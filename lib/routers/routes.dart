import 'package:fsmusic_flutter/pages/home/home.dart';
import 'package:fsmusic_flutter/pages/login/login.dart';
import 'package:fsmusic_flutter/pages/not_found.dart';
import 'package:fsmusic_flutter/pages/test/test.dart';
import 'package:fsmusic_flutter/routers/r_handler.dart';
import 'package:fsmusic_flutter/routers/utils.dart';
import 'package:fsmusic_flutter/utils/fsm_log.dart';

const sTag = "Routes";

class Routes {
  static const String home = "/";
  static const String test = "/test/:id";
  static const String login = "/login";
  static const String profile = "/profile/:id";
  static const String p404 = "/404";

  static final RPage notFound = RPage(name: home, builder: (ctx, [_, __]) => const NotFoundPage());

  static final List<RPage> pages = [
    RPage(name: home, builder: (ctx, [_, __]) => const HomePage()),
    RPage(name: login, builder: (ctx, [_, __]) => const LoginPage()),
    RPage(
      name: test,
      builder: (ctx, [pArg, args]) => TestPage(id: pArg?["id"] ?? "0", data: TestBean.fromJson(args ?? {})),
    ),
  ];
}

Future<bool> intercept(Uri uri) async {
  FLog.d(sTag, "intercept = $uri");
  return false;
}

abstract class Jsonable {
  Map<String, String> toJson();
}

class Nav {
  static final delegate = RDelegate((ctx, uri) {
    RPage page = matchPage(uri, Routes.pages) ?? Routes.notFound;
    Arg arg = parseArgs(uri, page.name);
    return page.builder(ctx, arg.pArgs, arg.args);
  }, [intercept]);
  static final parser = RParser();

  static Future<dynamic> to(String rName, {List<String>? pArgs, Jsonable? params, bool replace = false}) {
    Uri rUri = Uri.parse(rName);
    List<String> pKeys = rUri.pathSegments.where((element) => element.startsWith(":")).toList();
    Map<String, String>? pMArgs;
    if (pArgs?.isNotEmpty == true && pArgs!.length == pKeys.length) {
      pMArgs = {};
      var _cPArgs = List.of(pArgs);
      var es = pKeys.map((e) => MapEntry(e.replaceFirst(":", ""), _cPArgs.removeAt(0))).toList();
      pMArgs = Map.fromEntries(es);
    }
    String targetSUri = convertToUri(rName, pathArgs: pMArgs, args: params?.toJson());
    return delegate.toUri(Uri.parse(targetSUri), replace: replace);
  }

  static void pop<T>([T? result]) {
    return delegate.pop(result);
  }
}
