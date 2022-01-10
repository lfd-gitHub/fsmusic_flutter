import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class NotFoundPage extends BasePage {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  String? withTitle() => "404";

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline),
        FsmText.def("404"),
      ],
    );
  }
}
