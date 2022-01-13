import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:fsmusic_flutter/config/cfg.dart';
import 'package:fsmusic_flutter/repository/api/api.dart';

class FHttp {
  static final FHttp _singleton = FHttp._();
  FHttp._();
  factory FHttp.inst() => _singleton;
  //=======================================
  final Dio _dio = _initDio(Dio());
  static Dio _initDio(Dio dio) {
    dio.options.headers = {};
    dio.options.baseUrl = Api.baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
    dio.options.contentType = Headers.jsonContentType;
    dio.options.responseType = ResponseType.json;
    if (isDebug) {
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    return dio;
  }

  FHttp regInterceptors(List<Interceptor> list) {
    if (_dio.interceptors.isNotEmpty && _dio.interceptors.first.runtimeType == LogInterceptor) {
      _dio.interceptors.removeRange(1, _dio.interceptors.length);
    } else {
      _dio.interceptors.clear();
    }
    _dio.interceptors.addAll(list);
    return this;
  }
}

enum Method { get, post, put, delete }
typedef ResultConvert<T> = T Function(Map<String, dynamic> json);

class FRequest<T> {
  FRequest(this.url, {this.params, this.headers}) {
    _initConnection();
    _initOptions();
  }
  final CancelToken cancelable = CancelToken();
  //================
  final String url;
  final Map<String, dynamic>? params;
  final Map<String, String>? headers;
  late Method method;
  //==================
  late Dio _connection;
  Options? _options;
  ResultConvert<T>? _convert;
  Map<String, String>? _files;

  void _initConnection() {
    _connection = FHttp.inst()._dio;
  }

  void _initOptions() {
    if (headers?.isNotEmpty == true) {
      _options = Options(headers: headers);
    }
  }

  FRequest<T> withNewConnection() {
    _connection = Dio();
    return this;
  }

  FRequest<T> withMethod(Method method) {
    this.method = method;
    return this;
  }

  FRequest<T> withConvert(ResultConvert<T> resultConvert) {
    _convert = resultConvert;
    return this;
  }

  FRequest<T> withUpload(String formName, String path) {
    _files = _files ?? {};
    _files![formName] = path;
    return this;
  }

  MultipartFile _toMPF(String path) => MultipartFile.fromFileSync(path, filename: basename(path));

  FormData? _makeUpFormData() {
    if (_files?.isNotEmpty == true) {
      var formData = FormData.fromMap(params ?? {});
      var map = _files!.map((key, value) => MapEntry(key, _toMPF(value))).entries;
      formData.files.addAll(map);
      return formData;
    }
    return null;
  }

  Future<FResponse<T>> exec() {
    assert(_convert != null, "convert not setted!");
    return _execute(method);
  }

  Future<FResponse<T>> post() => _execute(Method.post);
  Future<FResponse<T>> get() => _execute(Method.get);
  Future<FResponse<T>> put() => _execute(Method.put);
  Future<FResponse<T>> delete() => _execute(Method.delete);
  Future<bool> download(String savePath, Function(int received, int total) progress) async {
    try {
      Response response = await _connection.download(
        url,
        savePath,
        cancelToken: cancelable,
        onReceiveProgress: progress,
      );
      return response.statusCode == 200;
    } catch (e, s) {
      if (isDebug) debugPrintStack(stackTrace: s);
      return false;
    }
  }

  Future<FResponse<T>> _execute(Method method) async {
    Response? response;
    T? data;
    try {
      response = await _request(method);
      data = _convert?.call(response.data);
    } on DioError catch (e, s) {
      response = e.response;
      if (response?.data is Map) {
        try {
          data = _convert?.call(response!.data);
        } catch (e, s) {
          if (isDebug) debugPrintStack(stackTrace: s);
        }
      }
      if (isDebug) debugPrintStack(stackTrace: s);
    } catch (e, s) {
      if (isDebug) debugPrintStack(stackTrace: s);
    }
    return FResponse(
      httpCode: response?.statusCode,
      httpMessage: response?.statusMessage,
      request: this,
      data: data,
    );
  }

  Future<Response> _request(Method method) async {
    Future<Response> response;
    var formData = _makeUpFormData();
    switch (method) {
      case Method.get:
        response = _connection.get(url, queryParameters: params, options: _options, cancelToken: cancelable);
        break;
      case Method.post:
        response = _connection.post(url, data: formData ?? params, options: _options, cancelToken: cancelable);
        break;
      case Method.put:
        response = _connection.put(url, queryParameters: params, options: _options, cancelToken: cancelable);
        break;
      case Method.delete:
        response = _connection.delete(url, queryParameters: params, options: _options, cancelToken: cancelable);
        break;
    }
    return response;
  }
}

class FResponse<T> {
  final FRequest<T>? request;
  final int? httpCode;
  final T? data;
  final String? httpMessage;
  FResponse({this.httpCode, this.request, this.httpMessage, this.data});

  @override
  String toString() {
    return 'FResponse(request: $request, httpCode: $httpCode, data: $data, httpMessage: $httpMessage)';
  }
}
