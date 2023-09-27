import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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
  final dir = Directory(
      '/Users/admins/Documents/FlutterProjects/video_editor_app/assets/raw');
  final entities = await dir.list().toList();
  for (var i = 0; i < entities.length; i++) {
    final enity = entities[i];
    final nameFile = enity.path.split('/').last;
    if(nameFile.startsWith('.'))
    {
      continue;
    }
    final pathFile = File(enity.path);
    var text = await pathFile.readAsString();
    //find keys
    final regExpKeys = RegExp(r'(?<=(<string name="))(.*?)(?=")');
    final keyMaths = regExpKeys.allMatches(text);
    //find value
    final regExpValues = RegExp(r'(?:>)((.+?|\n)*?)(?=</string>)');
    final valueMaths = regExpValues.allMatches(text);

    for (var i = 0; i < keyMaths.length; i++) {
      final key = keyMaths.elementAt(i).group(0);
      final value =
          valueMaths.elementAt(i).group(0)?.replaceAll(RegExp('>'), "");
      final oldText = "<string name=\"$key\">$value</string>";
      final newText = "<$key>$value</$key>";
      text = text.replaceAll(oldText, newText);
    }
    final File file = File(
        '/Users/admins/Documents/FlutterProjects/video_editor_app/assets/translations/$nameFile');
    file.createSync();
    text = text.replaceAll('<resources>', '');
    await file.writeAsString(text);
    print(file.path);
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
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
