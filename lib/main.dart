import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:status_bar_control/status_bar_control.dart';

import 'pages/home/home.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await StatusBarControl.setHidden(true, animation: StatusBarAnimation.SLIDE);

  await loadAsset();

  runApp(
    const MyApp(),
  );
}

Future<void> loadAsset() async {
  var text = await rootBundle.loadString('assets/raw/en-US.xml');
  //find keys
  final regExpKeys = RegExp(r'(?<=(<string name="))(.*?)(?=")');
  final keyMaths = regExpKeys.allMatches(text);
  //find value
  final regExpValues = RegExp(r'(?:>)((.+?|\n)*?)(?=</string>)');
  final valueMaths = regExpValues.allMatches(text);

  print(keyMaths.length);
  print(valueMaths.length);
// translations
  for (var i = 0; i < keyMaths.length; i++) {
    final key = keyMaths.elementAt(i).group(0);
    final value = valueMaths.elementAt(i).group(0)?.replaceAll(RegExp('>'), "");
    final oldText = "<string name=\"$key\">$value</string>";
    final newText = "<$key>$value</$key>";
    text = text.replaceAll(oldText, newText);
  }
  print(text);
  final File file = File('/Users/admins/Documents/FlutterProjects/video_editor_app/assets/translations/en-US.xml');
  await file.create();
  await file.writeAsString(text);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MaterialApp(
        home: const Home(),
      ),
    );
  }
}
