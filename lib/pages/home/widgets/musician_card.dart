import 'package:flutter/cupertino.dart';
import 'package:fsmusic_flutter/widgets/fsm_title_tile.dart';

class MusicianBanner extends StatelessWidget {
  const MusicianBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        FsmTitleTile(title: "热榜音乐", tail: "更多"),
      ],
    );
  }
}
