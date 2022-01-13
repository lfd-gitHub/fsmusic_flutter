import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/pages/login/service/login_form_state.dart';
import 'package:fsmusic_flutter/pages/login/service/login_service.dart';
import 'package:fsmusic_flutter/pages/login/widgets/login_form.dart';
import 'package:fsmusic_flutter/utils/fsm_log.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class LoginPage extends BasePage<LoginService, FormEvent, LoginFormState> {
  static const sTag = "LoginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginService service() => LoginService();

  @override
  String? withTitle() => null;

  @override
  Widget bodyWithTheme(BuildContext context, ThemeData theme) {
    return Stack(
      children: [
        Container(color: theme.primaryColor, constraints: const BoxConstraints.expand()),
        Container(
          margin: const EdgeInsets.only(top: 120),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: DefaultTabController(
            length: 2,
            child: Column(children: [
              TabBar(
                labelColor: theme.primaryColor,
                unselectedLabelColor: const Color(0xFF7A869A),
                tabs: const [
                  Tab(text: "登陆"),
                  Tab(text: "注册"),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  widgetBuilder(
                    buildWhen: (ps, cs) => ps != cs,
                    builder: (builder, ser, s) => Column(
                      children: [
                        LoginForm(loginService: ser, loginFormState: s),
                        const SizedBox(height: 44),
                        const Spacer(),
                        Center(
                          child: Builder(builder: (context) {
                            return FText(
                              "还没有账号？",
                              appends: const ["去注册"],
                              appendColors: [theme.primaryColor],
                              onTap: (i) {
                                FLog.d("$i ===> ${DefaultTabController.of(context)}");
                                if (i == 1) DefaultTabController.of(context)?.animateTo(1);
                              },
                            );
                          }),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(),
                ]),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
