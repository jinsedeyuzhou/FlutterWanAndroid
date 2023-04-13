import 'package:json_annotation/json_annotation.dart';

part 'base_response_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T> extends Object {
  ListData<T> data;
  int errorCode;
  String errorMsg;

  BaseListResponse({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  factory BaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$BaseListResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseListResponseToJson<T>(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ListData<T> {
  int? curPage;
  List<T> datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  ListData({
    this.curPage,
    required this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory ListData.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$ListDataFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ListDataToJson<T>(this, toJsonT);
}
