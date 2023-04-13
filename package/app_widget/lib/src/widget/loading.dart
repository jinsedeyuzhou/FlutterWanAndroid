import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
import '../../res/app_values.dart';
import '/src/widget/elevated_container.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ElevatedContainer(
        padding: EdgeInsets.all(AppValues.largeMargin),
        child: CupertinoActivityIndicator(
          color: AppColors.colorWhite,
          radius: 12,
        ),
      ),
    );
  }
}
