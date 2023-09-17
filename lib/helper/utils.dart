import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_editor_app/pages/inapp/inapp_screen.dart';

class Utils {
  static void pushPage(BuildContext context, Widget routePage) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => routePage,
      ),
    );
  }

  void showProScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return const InappScreen();
      },
    );
  }
}
