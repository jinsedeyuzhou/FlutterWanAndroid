// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemEntity _$SystemEntityFromJson(Map<String, dynamic> json) => SystemEntity(
      json['author'] as String,
      (json['children'] as List<dynamic>)
          .map((e) => Children.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['courseId'] as int,
      json['cover'] as String,
      json['desc'] as String,
      json['id'] as int,
      json['lisense'] as String,
      json['lisenseLink'] as String,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['type'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int,
    );

Map<String, dynamic> _$SystemEntityToJson(SystemEntity instance) =>
    <String, dynamic>{
      'author': instance.author,
      'children': instance.children,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'type': instance.type,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      json['author'] as String,
      json['courseId'] as int,
      json['cover'] as String,
      json['desc'] as String,
      json['id'] as int,
      json['lisense'] as String,
      json['lisenseLink'] as String,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['type'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int,
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'author': instance.author,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'type': instance.type,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
