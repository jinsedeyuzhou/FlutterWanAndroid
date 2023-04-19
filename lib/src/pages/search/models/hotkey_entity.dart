import 'package:json_annotation/json_annotation.dart';

part 'hotkey_entity.g.dart';


@JsonSerializable()
class HotkeyEntity extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'visible')
  int visible;

  HotkeyEntity(this.id,this.link,this.name,this.order,this.visible,);

  factory HotkeyEntity.fromJson(Map<String, dynamic> srcJson) => _$HotkeyEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotkeyEntityToJson(this);

}
