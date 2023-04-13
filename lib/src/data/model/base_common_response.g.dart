// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCommonResponse<T> _$BaseCommonResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseCommonResponse<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
    );

Map<String, dynamic> _$BaseCommonResponseToJson<T>(
  BaseCommonResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
