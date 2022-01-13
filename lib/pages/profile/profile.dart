import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/pages/basic/base_page.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class ProfilePage extends DefaultPage {
  final String uId;

  const ProfilePage({Key? key, required this.uId}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Center(
      child: FText("id = $uId"),
    );
  }
}
