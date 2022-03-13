import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/pages/basic/base_service.dart';
import 'package:fsmusic_flutter/pages/global/widgets/music_card.dart';
import 'package:fsmusic_flutter/widgets/fsm_image.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class PlayListPage extends DefaultPage {
  const PlayListPage({Key? key}) : super(key: key);

  @override
  DefaultService service() => DefaultService();

  @override
  Color? bodyColor() => Colors.white;

  @override
  Widget bodyWithTheme(BuildContext context, ThemeData theme) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const SliverAppBar(
            title: Text("音乐列表详情"),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            pinned: true,
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.more_vert),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                FsmImage.svg("album-pd.svg", width: 160, height: 160),
                const SizedBox(height: 10),
                const FText("Global Viral 20", weight: semiBold, size: 18),
                const SizedBox(height: 10),
                const FText("COLDPLAY,KODALINE AND MANY MORE", color: Color(0xff7a869a), size: 14, width: 240, maxLines: 2, textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                        child: const FText("Play", color: Colors.white, size: 18, weight: medium),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          maximumSize: const Size(44, 44),
                          minimumSize: const Size(44, 44),
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          backgroundColor: theme.primaryColor.withAlpha(80)),
                      onPressed: () {},
                      child: FsmImage.svg("save.svg"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ];
      },
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemBuilder: (ctx, i) {
            return const MusicCard("musician-photo.png", "Always in my Heart", "Coldplay - Ghost Stories", type: 'detail');
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
