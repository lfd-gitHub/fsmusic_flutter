import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_image.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final EdgeInsets margin;

  final VoidCallback? onTap;

  const CategoryCard(
      {Key? key,
      this.onTap,
      this.margin = const EdgeInsets.symmetric(horizontal: 10),
      required this.title,
      required this.desc,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: margin,
            width: 140,
            height: 220,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: FsmImage.asset(image),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 25,
          right: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FText(title, color: Colors.white, size: 18),
              FText(
                desc,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        )
      ],
    );
  }
}
