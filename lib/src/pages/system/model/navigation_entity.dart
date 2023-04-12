import 'package:json_annotation/json_annotation.dart';

part 'system_entity.g.dart';


@JsonSerializable()
class SystemEntity extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'children')
  List<Children> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'lisense')
  String lisense;

  @JsonKey(name: 'lisenseLink')
  String lisenseLink;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  SystemEntity(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.type,this.userControlSetTop,this.visible,);

  factory SystemEntity.fromJson(Map<String, dynamic> srcJson) => _$SystemEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SystemEntityToJson(this);

}


@JsonSerializable()
class Children extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'lisense')
  String lisense;

  @JsonKey(name: 'lisenseLink')
  String lisenseLink;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  Children(this.author,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.type,this.userControlSetTop,this.visible,);

  factory Children.fromJson(Map<String, dynamic> srcJson) => _$ChildrenFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);

}