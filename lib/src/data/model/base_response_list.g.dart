// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponse<T> _$BaseListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseListResponse<T>(
      data: ListData<T>.fromJson(
          json['data'] as Map<String, dynamic>, (value) => fromJsonT(value)),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
    );

Map<String, dynamic> _$BaseListResponseToJson<T>(
  BaseListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.toJson(
        (value) => toJsonT(value),
      ),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

ListData<T> _$ListDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListData<T>(
      curPage: json['curPage'] as int?,
      datas: (json['datas'] as List<dynamic>).map(fromJsonT).toList(),
      offset: json['offset'] as int?,
      over: json['over'] as bool?,
      pageCount: json['pageCount'] as int?,
      size: json['size'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$ListDataToJson<T>(
  ListData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas.map(toJsonT).toList(),
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
