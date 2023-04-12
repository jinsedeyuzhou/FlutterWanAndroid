import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch/flutter_arch.dart';
import 'package:flutter_news/src/data/model/article_list_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemArticleList extends StatelessWidget with BaseWidgetMixin {
  final ArticleListEntity article;

  ItemArticleList({Key? key, required this.article}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(),
              _bulidContent(),
              _buildFooter(),
            ],
          ),
        ));
  }

  _buildTitle() {
    return Row(
      
    );
  }

  _bulidContent() {}

  _buildFooter() {}
}
