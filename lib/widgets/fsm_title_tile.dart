import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class FsmTitleTile extends StatelessWidget {
  final String title;
  final String tail;
  final EdgeInsets padding;

  const FsmTitleTile(
      {Key? key,
      required this.title,
      required this.tail,
      this.padding = const EdgeInsets.symmetric(horizontal: 25, vertical: 20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          FText(title, weight: semiBold, size: 22),
          const Spacer(),
          FText(tail, size: 14, color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
