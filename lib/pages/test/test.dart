import 'package:flutter/material.dart';

import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/routers/routes.dart';
//import 'package:fsmusic_flutter/router/fsm_router.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class TestPage extends BasePage {
  final String id;
  final TestBean data;

  const TestPage({Key? key, required this.id, required this.data}) : super(key: key);

  @override
  String? withTitle() => "test";

  @override
  Widget body(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FsmText.def("id = $id , data = $data"),
            ElevatedButton(onPressed: () => Nav.pop("rrrrrr"), child: const Text("test pop with obj")),
          ],
        ),
      ),
    );
  }
}

class TestBean with Jsonable {
  String? value;
  int? age;

  TestBean(this.value, this.age);

  TestBean.fromJson(Map<String, String> json) {
    value = json['value'];
    age = int.tryParse(json['age'] ?? '0');
  }

  @override
  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['value'] = value ?? '';
    data['age'] = '$age';
    return data;
  }

  @override
  String toString() => 'TestBean(value: $value, age: $age)';
}
