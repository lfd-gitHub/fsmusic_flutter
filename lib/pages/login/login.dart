import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  String? withTitle() => "login";

  @override
  Widget body(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          //FsmRouter.push(Routes.home);
        },
        child: FsmText.def("登录"),
      ),
    );
  }
}
