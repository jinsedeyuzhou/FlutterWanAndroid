import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../res/app_colors.dart';
import '/src/widget/app_bar_title.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final SystemUiOverlayStyle? style;
  final Widget? leading;

  final PreferredSizeWidget? bottom;

  CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = false,
    this.style,
    this.leading,  this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: leading,
      systemOverlayStyle: style,
      toolbarHeight: 44,
      bottom: bottom,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      title: AppBarTitle(text: appBarTitleText),
    );
  }
}
