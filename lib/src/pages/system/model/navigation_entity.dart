import 'package:json_annotation/json_annotation.dart';

part 'navigation_entity.g.dart';


@JsonSerializable()
class NavigationEntity extends Object {

  @JsonKey(name: 'articles')
  List<Articles> articles;

  @JsonKey(name: 'cid')
  int cid;

  @JsonKey(name: 'name')
  String name;

  NavigationEntity(this.articles,this.cid,this.name,);

  factory NavigationEntity.fromJson(Map<String, dynamic> srcJson) => _$NavigationEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NavigationEntityToJson(this);

}


@JsonSerializable()
class Articles extends Object {

  @JsonKey(name: 'adminAdd')
  bool adminAdd;

  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'audit')
  int audit;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'canEdit')
  bool canEdit;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'descMd')
  String descMd;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'host')
  String host;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'isAdminAdd')
  bool isAdminAdd;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'niceShareDate')
  String niceShareDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'prefix')
  String prefix;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'realSuperChapterId')
  int realSuperChapterId;

  @JsonKey(name: 'route')
  bool? route;

  @JsonKey(name: 'selfVisible')
  int selfVisible;

  @JsonKey(name: 'shareUser')
  String shareUser;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  Articles(this.adminAdd,this.apkLink,this.audit,this.author,this.canEdit,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.descMd,this.envelopePic,this.fresh,this.host,this.id,this.isAdminAdd,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.realSuperChapterId,this.route,this.selfVisible,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory Articles.fromJson(Map<String, dynamic> srcJson) => _$ArticlesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

}
