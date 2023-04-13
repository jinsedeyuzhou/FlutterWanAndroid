import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleTag extends StatelessWidget {
  final String text;
  Color? color;

  ArticleTag(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    var themeColor = color ?? Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
        vertical: 0.5,
      ),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(4)),
          border: Border.all(width: 1, color: color ?? themeColor)),
      child: Text(text,
          style: TextStyle(color: color ?? themeColor, fontSize: 10)),
    );
  }
}
