import 'package:flutter/material.dart';
import 'package:flutter_arch/src/provider/view_model.dart';
import 'package:provider/provider.dart';

/// Provider封装类
///
/// 方便数据初始化
class ProviderWidgetSelector<T extends ViewModel, S extends Object>
    extends StatefulWidget {
  final ValueWidgetBuilder<S> builder;
  final S Function(BuildContext, T) selector;

  final ShouldRebuild<S>? shouldRebuild;

  final T model;
  final Widget? child;
  final Function(T model)? onModelReady;
  final bool autoDispose;

  const ProviderWidgetSelector({
    Key? key,
    required this.builder,
    required this.model,
    required this.selector,
    this.child,
    this.onModelReady,
    required this.autoDispose,
    this.shouldRebuild,
  }) : super(key: key);

  @override
  _ProviderWidgetSelectorState<T, S> createState() =>
      _ProviderWidgetSelectorState<T, S>();
}

class _ProviderWidgetSelectorState<T extends ViewModel, S extends Object>
    extends State<ProviderWidgetSelector<T, S>> {
  late T model;

  @override
  void initState() {
    model = widget.model;
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Selector<T, S>(
        shouldRebuild: widget.shouldRebuild,
        selector: widget.selector,
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
