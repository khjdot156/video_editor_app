import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:status_bar_control/status_bar_control.dart';

import 'pages/home/home.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  // final text = await rootBundle.loadString('assets/translations/en-US.xml');
  const tsst = '<string name="InShot_detail">InShot Pro details</string>';
  final regExp = RegExp(r'".*"');
//https://200lab.io/blog/regex-trong-ngon-ngu-dart/
//https://stackoverflow.com/questions/53239702/how-to-remove-only-symbols-from-string-in-dart

  final maths = regExp.firstMatch(tsst);
  print('maths: ${maths?.group(0)?..replaceAll("\"", "")}');
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
