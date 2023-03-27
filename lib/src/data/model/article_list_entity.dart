import 'package:flutter_news/generated/json/base/json_field.dart';
import 'package:flutter_news/generated/json/article_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ArticleListEntity {
  late bool adminAdd;
  late String apkLink;
  late int audit;
  late String author;
  late bool canEdit;
  late int chapterId;
  late String chapterName;
  late bool collect;
  late int courseId;
  late String desc;
  late String descMd;
  late String envelopePic;
  late bool fresh;
  late String host;
  late int id;
  late bool isAdminAdd;
  late String link;
  late String niceDate;
  late String niceShareDate;
  late String origin;
  late String prefix;
  late String projectLink;
  late int publishTime;
  late int realSuperChapterId;
  late bool route;
  late int selfVisible;
  late int shareDate;
  late String shareUser;
  late int superChapterId;
  late String superChapterName;
  late List<Tags> tags;
  late String title;
  late int type;
  late int userId;
  late int visible;
  late int zan;

  ArticleListEntity();

  factory ArticleListEntity.fromJson(Map<String, dynamic> json) =>
      $ArticleListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class Tags {
  late String name;
  late String url;

  Tags();

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
