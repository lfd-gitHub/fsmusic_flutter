import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_validate_error.dart';
import 'package:fsmusic_flutter/pages/login/service/login_form_state.dart';

import 'package:fsmusic_flutter/pages/login/service/login_service.dart';
import 'package:fsmusic_flutter/widgets/fsm_button.dart';
import 'package:fsmusic_flutter/widgets/fsm_form.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class LoginForm extends StatelessWidget {
  final LoginService loginService;
  final LoginFormState loginFormState;

  const LoginForm({
    Key? key,
    required this.loginService,
    required this.loginFormState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FText("请先登录", size: 22, color: theme.primaryColorDark),
          const SizedBox(height: 8),
          const FText(
            "欢迎登录登录登登录",
            color: Colors.grey,
          ),
          const SizedBox(height: 44),
          FTextField(
              label: "用户名",
              hint: "请输入用户名",
              error: loginFormState.formValidate.error?.isAndMsg([FormValidationError.usernameEmpty]),
              onChanged: (username) {
                loginService.validateUserName(username);
              }),
          const SizedBox(height: 32),
          FTextField(
              label: "密码",
              hint: "请输入密码",
              obscureText: true,
              error: loginFormState.formValidate.error?.isAndMsg([
                FormValidationError.passwordEmpty,
                FormValidationError.passwordLengthLess6,
              ]),
              onChanged: (password) {
                loginService.validatePassword(password);
              }),
          const SizedBox(height: 32),
          FText("忘记密码？", color: theme.primaryColor, weight: semiBold, onTap: (i) {}),
          const SizedBox(height: 32),
          FBtnPrimary(
              isProgressing: loginFormState.formState.isSubmissionInProgress,
              onTap: loginFormState.formState.isValidated
                  ? () {
                      loginService.add(const SubmitEvent());
                    }
                  : null,
              title: "登陆")
        ],
      ),
    );
  }
}
