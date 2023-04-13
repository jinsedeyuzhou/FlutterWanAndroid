import 'package:flutter/material.dart';

import '../../res/text_styles.dart';


class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: pageMainTitleStyle,
      textAlign: TextAlign.center,
    );
  }
}
