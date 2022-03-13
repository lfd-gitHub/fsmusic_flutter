import 'package:flutter/material.dart';

class FsmAppbar {
  static AppBar def(String title, {Color? background, Color? fColor, bool? noElevation}) {
    return AppBar(
      //systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: noElevation == true ? 0 : null,
      title: Text(title),
      backgroundColor: background,
      foregroundColor: fColor,
    );
  }
}
