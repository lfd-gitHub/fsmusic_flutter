import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/pages/basic/base_service.dart';
import 'package:fsmusic_flutter/pages/basic/base_state.dart';
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
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(100)),
          ),
          child: Row(
            children: [
              Column(
                children: const [FText("Good Evening,"), FText("Shendy Rian")],
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }

  @override
  DefaultService service() => DefaultService();
}
