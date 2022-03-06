import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_image.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class MusicCard extends StatelessWidget {
  final EdgeInsets padding;
  final String title;
  final String subTitle;
  final String cover;

  const MusicCard(
    this.cover,
    this.title,
    this.subTitle, {
    Key? key,
    this.padding = const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              FsmImage.circle(cover, 32),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
              )
            ],
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FText(title, size: 16, weight: semiBold, color: const Color(0xff002150)),
              const SizedBox(height: 4),
              FText(subTitle, size: 14, color: const Color(0xff7a869a))
            ],
          )
        ],
      ),
    );
  }
}
