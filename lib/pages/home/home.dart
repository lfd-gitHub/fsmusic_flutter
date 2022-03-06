import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/pages/basic/base_service.dart';
import 'package:fsmusic_flutter/pages/basic/base_state.dart';
import 'package:fsmusic_flutter/pages/home/widgets/album_card.dart';
import 'package:fsmusic_flutter/pages/home/widgets/category_card.dart';
import 'package:fsmusic_flutter/pages/home/widgets/music_card.dart';
import 'package:fsmusic_flutter/pages/home/widgets/musician_card.dart';
import 'package:fsmusic_flutter/pages/home/widgets/scroll_section.dart';
import 'package:fsmusic_flutter/widgets/common/badge.dart';
import 'package:fsmusic_flutter/widgets/fsm_image.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';
import 'package:fsmusic_flutter/widgets/fsm_title_tile.dart';

class HomePage extends BasePage<DefaultService, DefaultEvent, DefaultState> {
  static const sTag = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget bodyWithTheme(BuildContext context, ThemeData theme) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 32),
                _buildTop(),
                const ScrollSection(children: [
                  CategoryCard(title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                  CategoryCard(title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                  CategoryCard(title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                  CategoryCard(title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                ]),
                const ScrollSection(title: "热榜音乐人", children: [
                  MusicianCard("musician-photo.png", "哈雷娜", "流星音乐"),
                  MusicianCard("musician-photo.png", "哈雷娜", "流星音乐"),
                  MusicianCard("musician-photo.png", "哈雷娜", "流星音乐"),
                  MusicianCard("musician-photo.png", "哈雷娜", "流星音乐"),
                ]),
                const ScrollSection(title: "推荐歌单", children: [
                  AlbumCard("album.png", "哈雷娜", "流星音乐"),
                  AlbumCard("album.png", "哈雷娜", "流星音乐"),
                  AlbumCard("album.png", "哈雷娜", "流星音乐"),
                  AlbumCard("album.png", "哈雷娜", "流星音乐"),
                ]),
                const FsmTitleTile(title: "最近播放", tail: "更多"),
                Column(
                  children: const [
                    MusicCard("musician-photo.png", "Always in my Heart", "Coldplay - Ghost Stories"),
                    MusicCard("musician-photo.png", "Always in my Heart", "Coldplay - Ghost Stories"),
                    MusicCard("musician-photo.png", "Always in my Heart", "Coldplay - Ghost Stories"),
                    MusicCard("musician-photo.png", "Always in my Heart", "Coldplay - Ghost Stories"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTop() {
    return Row(
      children: [
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FText("Good Evening,", color: Colors.grey, size: 16),
            FText("Player", color: Colors.white, size: 24, weight: FontWeight.bold),
          ],
        ),
        const Spacer(),
        Badge(
          child: FsmImage.svg(
            "bell.svg",
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 16),
        FsmImage.asset("avatar.png"),
        const SizedBox(width: 24)
      ],
    );
  }

  @override
  DefaultService service() => DefaultService();
}
