import 'package:json_annotation/json_annotation.dart';

part 'base_list_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseListData<T> extends Object {
  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<T> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  BaseListData(
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  );

  factory BaseListData.fromJson(
          Map<String, dynamic> srcJson, T Function(Object? json) fromJsonT) =>
      _$BaseListFromJson(srcJson, fromJsonT);

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$BaseListDataToJson(
        this,
        toJsonT,
      );
}
