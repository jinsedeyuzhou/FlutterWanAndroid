import 'package:json_annotation/json_annotation.dart';

part 'base_common_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseCommonResponse<T> {
  List<T> data;
  int errorCode;
  String errorMsg;

  BaseCommonResponse({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  factory BaseCommonResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT,
      ) =>
      _$BaseCommonResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseCommonResponseToJson<T>(this, toJsonT);
}
