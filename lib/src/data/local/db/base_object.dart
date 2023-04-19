import 'dart:ffi';

import 'package:floor/floor.dart';

class BaseObject {
  @PrimaryKey()
  final int? id;

  @ColumnInfo(name: 'create_time')
  final String? createTime;

  @ColumnInfo(name: 'update_time')
  final String? updateTime;

  BaseObject({
    this.id,
    String? updateTime,
    String? createTime,
  })  : createTime = createTime ?? DateTime.now().toString(),
        updateTime = updateTime ?? DateTime.now().toString();

  @override
  List<Object> get props => [];
}

@Entity(tableName: 'comments')
class Comment extends BaseObject {
  final String author;

  final String content;

  Comment(this.author,
      {this.content = '', String? createTime, String? updateTime})
      : super(updateTime: updateTime, createTime: createTime);
}
