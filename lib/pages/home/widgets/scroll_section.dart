import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_title_tile.dart';

class ScrollSection extends StatelessWidget {
  final EdgeInsets padding;
  final String? title;
  final List<Widget> children;

  const ScrollSection({
    Key? key,
    this.title,
    required this.children,
    this.padding = const EdgeInsets.only(left: 15, right: 15, top: 22),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget scroll = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          const SizedBox(width: 15),
          ...children,
          const SizedBox(width: 15),
        ],
      ),
    );
    if (title == null) {
      return Padding(
        padding: EdgeInsets.only(top: padding.top, bottom: padding.bottom),
        child: scroll,
      );
    }
    return Column(
      children: [
        SizedBox(height: padding.top),
        FsmTitleTile(title: title!, tail: "更多"),
        scroll,
        SizedBox(height: padding.bottom),
      ],
    );
  }
}
