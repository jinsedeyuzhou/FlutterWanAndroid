import 'package:json_annotation/json_annotation.dart';

part 'response_result.g.dart';

///   一般列表
///    BaseResponse<List<CategoryModel>> result =
///         BaseResponse.fromJson(json, (json) {
///       return (json as List<dynamic>)
///           .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
///           .toList();
///     });
///
///     嵌套列表
///    BaseResponse<ListData<ArticleModel>> result =
///         BaseResponse.fromJson(json, (json) {
///      return ListData.fromJson(json, (json) => ArticleModel.fromJson(json));
///     });
///
///  一般对象
///    BaseResponse<CategoryModel> result =
///         BaseResponse.fromJson(json, (json) {
///       return  CategoryModel.fromJson(e as Map<String, dynamic>)；
///     });
@JsonSerializable(genericArgumentFactories: true)
class ResponseResult<T> extends Object {
  @JsonKey(name: 'data')
  T? data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  ResponseResult(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory ResponseResult.fromJson(
          Map<String, dynamic> srcJson, T Function(Object? json) fromJsonT) =>
      _$ResponseResultFromJson(
        srcJson,
        fromJsonT,
      );

  Map<String, dynamic> toJson(
    Object Function(T value) toJsonT,
  ) =>
      _$ResponseResultToJson(
        this,
        toJsonT,
      );
}
