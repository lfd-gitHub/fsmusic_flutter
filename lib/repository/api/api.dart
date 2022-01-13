import 'package:fsmusic_flutter/config/cfg.dart';
import 'package:fsmusic_flutter/repository/api/base/base_resp_model.dart';
import 'package:fsmusic_flutter/repository/api/http.dart';

class Api {
  Api._();
  static const version = "";
  static String get baseUrl => "$defaultBaseUrl$version";

  ///============用户模块============
  static const String login = "api/user/login";

  static FRequest<ApiRespModel<T>> newRequest<T>(
    String url, {
    required T Function(dynamic json) dataConvert,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
    bool autoFillCommParams = true,
  }) {
    if (autoFillCommParams) params = fillCommonReq(params ?? {});
    return FRequest<ApiRespModel<T>>(url, params: params, headers: headers) //
        .withConvert(
      (json) => ApiRespModel.fromJson(json, dataConvert),
    );
  }
}

Map<String, dynamic> fillCommonReq(Map<String, dynamic> params) {
  return _removeNullValue(params);
}

T _removeNullValue<T extends Map>(T map) {
  return map..removeWhere((key, v) => v == null);
}
