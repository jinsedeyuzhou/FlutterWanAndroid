import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'image_helper.dart';

/// 基础Widget
class ViewStateWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? image;
  final Widget? buttonText;
  final String? buttonTextData;
  final VoidCallback onPressed;

  ViewStateWidget(
      {Key? key,
      this.image,
      this.title,
      this.message,
      this.buttonText,
      required this.onPressed,
      this.buttonTextData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle =
        Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey);
    var messageStyle = titleStyle?.copyWith(
        color: titleStyle.color?.withOpacity(0.7), fontSize: 14);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image ?? Icon(Icons.hourglass_empty, size: 80, color: Colors.grey[500]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title ?? AppLocalizations.of(context)!.viewStateMessageError,
                style: titleStyle,
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 200, minHeight: 150),
                child: SingleChildScrollView(
                  child: Text(message ?? '', style: messageStyle),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: ViewStateButton(
            textData: buttonTextData,
            onPressed: onPressed,
            child: buttonText,
          ),
        ),
      ],
    );
  }
}

/// ErrorWidget
class ViewStateErrorWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final String? errorMessage;
  final Widget? image;
  final Widget? buttonText;
  final String? buttonTextData;
  final VoidCallback onPressed;

  const ViewStateErrorWidget({
    Key? key,
    this.image,
    this.title,
    this.message,
    this.errorMessage,
    this.buttonText,
    this.buttonTextData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String defaultTextData = AppLocalizations.of(context)!.viewStateButtonRetry;
    var defaultImage =
        const Icon(IconFonts.pageEmpty, size: 100, color: Colors.grey);
    var defaultTitle = AppLocalizations.of(context)!.viewStateMessageError;

    return ViewStateWidget(
      onPressed: onPressed,
      image: image ?? defaultImage,
      title: title ?? defaultTitle,
      message: message ?? errorMessage,
      buttonTextData: buttonTextData ?? defaultTextData,
      buttonText: buttonText,
    );
  }
}

/// 页面无数据
class ViewStateEmptyWidget extends StatelessWidget {
  final String? message;
  final Widget? image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateEmptyWidget(
      {required Key key,
      this.image,
      this.message,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: onPressed,
      image: image ??
          const Icon(IconFonts.pageEmpty, size: 100, color: Colors.grey),
      title: message ?? AppLocalizations.of(context)!.viewStateMessageEmpty,
      buttonText: buttonText,
      buttonTextData: AppLocalizations.of(context)!.viewStateButtonRefresh,
      message: '',
    );
  }
}

/// 公用Button
class ViewStateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final String? textData;

  const ViewStateButton({required this.onPressed, this.child, this.textData})
      : assert(child == null || textData == null);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: Theme.of(context).primaryColor),
      ),
      child: child ??
          Text(
            textData ?? AppLocalizations.of(context)!.viewStateButtonRetry,
            style: const TextStyle(wordSpacing: 5),
          ),
    );
  }
}
