import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/routers/routes.dart';
import 'package:fsmusic_flutter/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: Nav.parser, // 路由信息解析
      routerDelegate: Nav.delegate, // 路由代理
    );
  }
}
