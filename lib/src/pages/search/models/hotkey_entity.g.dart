// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotkey_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotkeyEntity _$HotkeyEntityFromJson(Map<String, dynamic> json) => HotkeyEntity(
      json['id'] as int,
      json['link'] as String,
      json['name'] as String,
      json['order'] as int,
      json['visible'] as int,
    );

Map<String, dynamic> _$HotkeyEntityToJson(HotkeyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
