import 'package:flutter/material.dart';

class FsmText {
  static Widget def(
    String text, [
    double? size,
    FontWeight weight = FontWeight.normal,
    Color? color,
  ]) {
    return Text(text, style: TextStyle(fontWeight: weight, fontSize: size, color: color));
  }
}
