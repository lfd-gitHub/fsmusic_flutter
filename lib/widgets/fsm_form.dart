import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class FTextField extends StatelessWidget {
  final double height;
  final void Function(String text) onChanged;
  final String hint;
  final String? label;
  final String? error;
  final double labelSize;
  final double fontSize;
  final bool obscureText;

  const FTextField({
    Key? key,
    required this.onChanged,
    required this.hint,
    this.obscureText = false,
    this.height = kMinInteractiveDimension,
    this.fontSize = 18,
    this.label,
    this.labelSize = 14,
    this.error,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) FText(label!, size: labelSize, color: Colors.grey),
        if (label != null) const SizedBox(height: 8),
        SizedBox(
          height: height + _textSize(error, Theme.of(context).inputDecorationTheme.errorStyle).height,
          child: TextField(
            style: TextStyle(fontSize: fontSize, color: Theme.of(context).primaryColorDark),
            maxLines: 1,
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              errorText: error,
              hintText: hint,
              hintStyle: TextStyle(fontSize: fontSize, color: Colors.grey),
              fillColor: Colors.grey.shade100,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Size _textSize(String? text, TextStyle? style) {
    if (text == null) return Size.zero;
    TextStyle _style = style ?? const TextStyle();
    final TextPainter textPainter = TextPainter(text: TextSpan(text: text, style: _style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
