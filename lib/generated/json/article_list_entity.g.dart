import 'package:flutter_news/generated/json/base/json_convert_content.dart';
import 'package:flutter_news/src/data/model/article_list_entity.dart';

ArticleListEntity $ArticleListEntityFromJson(Map<String, dynamic> json) {
	final ArticleListEntity articleListEntity = ArticleListEntity();
	final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
	if (adminAdd != null) {
		articleListEntity.adminAdd = adminAdd;
	}
	final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
	if (apkLink != null) {
		articleListEntity.apkLink = apkLink;
	}
	final int? audit = jsonConvert.convert<int>(json['audit']);
	if (audit != null) {
		articleListEntity.audit = audit;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		articleListEntity.author = author;
	}
	final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
	if (canEdit != null) {
		articleListEntity.canEdit = canEdit;
	}
	final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
	if (chapterId != null) {
		articleListEntity.chapterId = chapterId;
	}
	final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
	if (chapterName != null) {
		articleListEntity.chapterName = chapterName;
	}
	final bool? collect = jsonConvert.convert<bool>(json['collect']);
	if (collect != null) {
		articleListEntity.collect = collect;
	}
	final int? courseId = jsonConvert.convert<int>(json['courseId']);
	if (courseId != null) {
		articleListEntity.courseId = courseId;
	}
	final String? desc = jsonConvert.convert<String>(json['desc']);
	if (desc != null) {
		articleListEntity.desc = desc;
	}
	final String? descMd = jsonConvert.convert<String>(json['descMd']);
	if (descMd != null) {
		articleListEntity.descMd = descMd;
	}
	final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
	if (envelopePic != null) {
		articleListEntity.envelopePic = envelopePic;
	}
	final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
	if (fresh != null) {
		articleListEntity.fresh = fresh;
	}
	final String? host = jsonConvert.convert<String>(json['host']);
	if (host != null) {
		articleListEntity.host = host;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		articleListEntity.id = id;
	}
	final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
	if (isAdminAdd != null) {
		articleListEntity.isAdminAdd = isAdminAdd;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		articleListEntity.link = link;
	}
	final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
	if (niceDate != null) {
		articleListEntity.niceDate = niceDate;
	}
	final String? niceShareDate = jsonConvert.convert<String>(json['niceShareDate']);
	if (niceShareDate != null) {
		articleListEntity.niceShareDate = niceShareDate;
	}
	final String? origin = jsonConvert.convert<String>(json['origin']);
	if (origin != null) {
		articleListEntity.origin = origin;
	}
	final String? prefix = jsonConvert.convert<String>(json['prefix']);
	if (prefix != null) {
		articleListEntity.prefix = prefix;
	}
	final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
	if (projectLink != null) {
		articleListEntity.projectLink = projectLink;
	}
	final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
	if (publishTime != null) {
		articleListEntity.publishTime = publishTime;
	}
	final int? realSuperChapterId = jsonConvert.convert<int>(json['realSuperChapterId']);
	if (realSuperChapterId != null) {
		articleListEntity.realSuperChapterId = realSuperChapterId;
	}
	final bool? route = jsonConvert.convert<bool>(json['route']);
	if (route != null) {
		articleListEntity.route = route;
	}
	final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
	if (selfVisible != null) {
		articleListEntity.selfVisible = selfVisible;
	}
	final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
	if (shareDate != null) {
		articleListEntity.shareDate = shareDate;
	}
	final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
	if (shareUser != null) {
		articleListEntity.shareUser = shareUser;
	}
	final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
	if (superChapterId != null) {
		articleListEntity.superChapterId = superChapterId;
	}
	final String? superChapterName = jsonConvert.convert<String>(json['superChapterName']);
	if (superChapterName != null) {
		articleListEntity.superChapterName = superChapterName;
	}
	final List<Tags>? tags = jsonConvert.convertListNotNull<Tags>(json['tags']);
	if (tags != null) {
		articleListEntity.tags = tags;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		articleListEntity.title = title;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		articleListEntity.type = type;
	}
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		articleListEntity.userId = userId;
	}
	final int? visible = jsonConvert.convert<int>(json['visible']);
	if (visible != null) {
		articleListEntity.visible = visible;
	}
	final int? zan = jsonConvert.convert<int>(json['zan']);
	if (zan != null) {
		articleListEntity.zan = zan;
	}
	return articleListEntity;
}

Map<String, dynamic> $ArticleListEntityToJson(ArticleListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['adminAdd'] = entity.adminAdd;
	data['apkLink'] = entity.apkLink;
	data['audit'] = entity.audit;
	data['author'] = entity.author;
	data['canEdit'] = entity.canEdit;
	data['chapterId'] = entity.chapterId;
	data['chapterName'] = entity.chapterName;
	data['collect'] = entity.collect;
	data['courseId'] = entity.courseId;
	data['desc'] = entity.desc;
	data['descMd'] = entity.descMd;
	data['envelopePic'] = entity.envelopePic;
	data['fresh'] = entity.fresh;
	data['host'] = entity.host;
	data['id'] = entity.id;
	data['isAdminAdd'] = entity.isAdminAdd;
	data['link'] = entity.link;
	data['niceDate'] = entity.niceDate;
	data['niceShareDate'] = entity.niceShareDate;
	data['origin'] = entity.origin;
	data['prefix'] = entity.prefix;
	data['projectLink'] = entity.projectLink;
	data['publishTime'] = entity.publishTime;
	data['realSuperChapterId'] = entity.realSuperChapterId;
	data['route'] = entity.route;
	data['selfVisible'] = entity.selfVisible;
	data['shareDate'] = entity.shareDate;
	data['shareUser'] = entity.shareUser;
	data['superChapterId'] = entity.superChapterId;
	data['superChapterName'] = entity.superChapterName;
	data['tags'] =  entity.tags;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}