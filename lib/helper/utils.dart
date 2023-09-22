import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  static Future<void> openUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void showProScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      // useSafeArea: true,
      useRootNavigator: true,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return const InappScreen();
      },
    );
  }
}
