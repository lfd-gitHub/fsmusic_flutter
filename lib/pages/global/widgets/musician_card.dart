import 'package:flutter/cupertino.dart';
import 'package:fsmusic_flutter/widgets/fsm_image.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class MusicianCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final EdgeInsets margin;

  const MusicianCard(this.image, this.title, this.subTitle,
      {Key? key, this.margin = const EdgeInsets.symmetric(horizontal: 10)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        children: [
          FsmImage.circle(image, 60),
          const SizedBox(height: 10),
          FText(title,
              size: 16, weight: semiBold, color: const Color(0xff002150)),
          const SizedBox(height: 4),
          FText(subTitle, size: 14, color: const Color(0xff7a869a))
        ],
      ),
    );
  }
}
