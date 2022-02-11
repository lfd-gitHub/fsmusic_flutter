import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/pages/basic/base_service.dart';
import 'package:fsmusic_flutter/pages/basic/base_state.dart';
import 'package:fsmusic_flutter/pages/home/widgets/category_banner.dart';
import 'package:fsmusic_flutter/widgets/common/badge.dart';
import 'package:fsmusic_flutter/widgets/fsm_image.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class HomePage extends BasePage<DefaultService, DefaultEvent, DefaultState> {
  static const sTag = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget bodyWithTheme(BuildContext context, ThemeData theme) {
    return Stack(
      children: [
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(100)),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                children: [
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      FText("Good Evening,", color: Colors.grey, size: 16),
                      FText("Player",
                          color: Colors.white,
                          size: 24,
                          weight: FontWeight.bold),
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
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    CategoryBanner(
                        title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                    CategoryBanner(
                        title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                    CategoryBanner(
                        title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                    CategoryBanner(
                        title: "嘻哈", desc: "1.4万播放量", image: "banner.png"),
                    SizedBox(width: 15),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  DefaultService service() => DefaultService();
}
