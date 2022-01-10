import 'package:fsmusic_flutter/routers/r_handler.dart';
import 'package:fsmusic_flutter/utils/fsm_log.dart';

const sTag = "RUtils";

String convertToUri(
  String routeName, {
  Map<String, String>? pathArgs,
  Map<String, String>? args,
}) {
  var _path = routeName;
  if (pathArgs?.isNotEmpty == true) {
    pathArgs!.forEach((key, value) => _path = _path.replaceFirst(":$key", Uri.encodeComponent(value)));
  }
  if (args?.isNotEmpty == true) {
    _path += "?";
    args!.forEach((key, value) => _path += "&$key=${Uri.encodeComponent(value)}");
  }
  FsmLog.d(sTag, "$routeName $pathArgs $args => convertToUrl => $_path");
  return _path;
}

Arg parseArgs(Uri uri, String routeName) {
  Uri oriUri = Uri.parse(routeName);
  final sOriSList = oriUri.pathSegments;
  final sLen = uri.pathSegments.length;
  Arg arg = Arg();
  if (sLen > 1 && sLen == oriUri.pathSegments.length) {
    arg.pArgs = {};
    for (var i = 0; i < sLen; i++) {
      String key = sOriSList[i];
      if (key.contains(":")) {
        arg.pArgs![key.replaceAll(":", "")] = Uri.decodeComponent(uri.pathSegments[i]);
      }
    }
  }
  if (uri.queryParameters.isNotEmpty) {
    arg.args = {};
    uri.queryParameters.forEach((key, value) {
      arg.args![key] = Uri.decodeComponent(value);
    });
  }
  return arg;
}

class Arg {
  Map<String, String>? pArgs;
  Map<String, String>? args;
}

Uri? matchUri(String rName, List<Uri> uris) {
  var list = uris.where((element) => matchedUriAndRName(rName, element));
  return list.isNotEmpty ? list.first : null;
}

bool matchedUriAndRName(String rName, Uri uri) {
  var pUri = Uri.parse(rName);
  var pSegs = pUri.pathSegments;
  if (pUri == uri) {
    return true;
  }
  FsmLog.d(sTag, "find $rName - $pSegs | $uri - ${uri.pathSegments}");
  if (pSegs.length != uri.pathSegments.length) {
    return false;
  }
  return pSegs.any((element) => uri.pathSegments.contains(element));
}

RPage? matchPage(Uri uri, List<RPage> pages) {
  FsmLog.d(sTag, "matchPage uri = $uri search in $pages");
  var list = pages.where((page) => matchedUriAndRName(page.name, uri));
  assert(list.length == 1, "not matched strickly! ? $list");
  FsmLog.d(sTag, "find result $list");
  return list.isEmpty ? null : list.first;
}
