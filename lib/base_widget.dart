import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T? model;

  const BaseWidget({Key? key, required this.builder, this.model})
      : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  bool isBusy = false;
  late T model;

  @override
  void initState() {
    model = widget.model!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return widget.builder!(context, model!, child!);
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<T>(
        builder: (BuildContext context, model, child) =>
            widget.builder(context, model, child!),
      ),
    );
  }
}

class WelcomeViewModel extends BaseViewModel {
  final String title = "Dari model";
}

class BaseViewModel extends ChangeNotifier {}
