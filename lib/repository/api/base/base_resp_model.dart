import 'package:json_annotation/json_annotation.dart';

part 'base_resp_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiRespModel<T> {
  int? code;
  String? errorMsg;
  T? data;

  ApiRespModel({this.code, this.errorMsg, this.data});

  factory ApiRespModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) //
      =>
      _$ApiRespModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiRespModelToJson(this, toJsonT);

  @override
  String toString() => 'BaseRespModel(code: $code, errorMsg: $errorMsg, data: $data)';
}
