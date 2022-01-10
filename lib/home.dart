import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/test/test.dart';
import 'package:fsmusic_flutter/routers/r_handler.dart';
import 'package:fsmusic_flutter/routers/routes.dart';
import 'package:fsmusic_flutter/utils/fsm_log.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class HomePage extends StatelessWidget {
  static const sTag = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        children: [
          ListTile(
            onTap: () => RDelegate.of(context).toUri(Uri.parse(Routes.login)),
            title: FsmText.def("登陆"),
          ),
          ListTile(
            onTap: () async {
              var r = await Nav.to(Routes.test, pArgs: ["111"], params: TestBean("999", 0));
              FsmLog.d(sTag, "result = $r");
            },
            title: FsmText.def("Test"),
          ),
          // const Divider(),
          // ListTile(
          //   onTap: () => FRouter.push(Routes.profile),
          //   title: FsmText.def("个人资料"),
          // ),
          // ListTile(
          //   onTap: () async {
          //     String url = convertToUri(Routes.test, pathArgs: {"id": "111"}, args: {"value": "vvvvv", "age": "101"});
          //     var rr = await FRouter.pushByUri(url);
          //     FsmLog.d(sTag, "result = $rr");
          //   },
          //   title: FsmText.def("Test by url"),
          // ),
          // ListTile(
          //   onTap: () => FRouter.push(Routes.test, pArgs: {"id": "222"}, args: {"value": "2222", "age": "222"}),
          //   title: FsmText.def("Test by bean"),
          // ),
          // ListTile(
          //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => const NotFoundPage())),
          //   title: FsmText.def("Test translation"),
          // ),
        ],
      ),
    );
  }
}
