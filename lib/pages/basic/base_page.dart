import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_appbar.dart';

abstract class BasePage<T> extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  String? withTitle() => null;
  AppBar? withappBar() => null;

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: withappBar() ?? (withTitle() == null ? null : FsmAppbar.def(withTitle()!)),
      body: body(context),
    );
  }
}
