import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FsmImage {
  static Widget asset(String name, {BoxFit fit = BoxFit.cover}) {
    return Image.asset("assets/images/$name", fit: fit);
  }

  static Widget circle(String name, double radius,
      {Color bgColor = Colors.white}) {
    return CircleAvatar(
        backgroundImage: AssetImage("assets/images/$name"),
        radius: radius,
        backgroundColor: bgColor);
  }

  static Widget svg(String name, {double? width, double? height}) {
    return SvgPicture.asset("assets/icons/$name", width: width, height: height);
  }
}
