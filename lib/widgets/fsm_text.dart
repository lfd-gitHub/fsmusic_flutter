import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const FontWeight thin = FontWeight.w100;
const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.normal;
const FontWeight medium = FontWeight.w600;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

class FText extends StatelessWidget {
  final String text;
  final List<String>? appends;
  final double size;
  final List<double>? appendSizes;
  final FontWeight weight;
  final List<FontWeight>? appendWeights;
  final Color color;
  final List<Color>? appendColors;
  final EdgeInsets padding;
  final void Function(int i)? onTap;
  const FText(
    this.text, {
    Key? key,
    this.appends,
    this.appendColors,
    this.appendSizes,
    this.appendWeights,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.size = 14,
    this.weight = FontWeight.normal,
    this.color = const Color(0xFF333333),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: appends?.isNotEmpty == true ? null : (onTap == null ? null : () => onTap!.call(0)),
      child: Padding(
          padding: padding,
          child: appends?.isNotEmpty == true
              ? Text.rich(TextSpan(children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => onTap?.call(0),
                    text: text,
                    style: TextStyle(fontWeight: weight, fontSize: size, color: color),
                  ),
                  ...appends!
                      .asMap()
                      .map(
                        (key, value) => MapEntry(
                          key,
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                onTap?.call(key + 1);
                              },
                            text: value,
                            style: TextStyle(
                                fontWeight: key < (appendWeights?.length ?? 0) ? appendWeights![key] : weight,
                                fontSize: key < (appendSizes?.length ?? 0) ? appendSizes![key] : size,
                                color: key < (appendColors?.length ?? 0) ? appendColors![key] : color),
                          ),
                        ),
                      )
                      .values
                      .toList()
                ])) //
              : Text(text, style: TextStyle(fontWeight: weight, fontSize: size, color: color))),
    );
  }
}
