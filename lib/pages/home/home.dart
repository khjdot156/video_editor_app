import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_app/helper/get_audio.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

import 'create_element.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Configuration? configuration;

  @override
  void initState() {
    super.initState();
  }

  Configuration createConfiguration() {
    final flutterSticker = Sticker(
        "example_sticker_logos_flutter", "Flutter", "assets/Flutter-logo.png");
    final imglySticker = Sticker(
        "example_sticker_logos_imgly", "img.ly", "assets/IgorSticker.png");

    /// A completely custom category.
    final logos = StickerCategory(
        "example_sticker_category_logos", "Logos", "assets/Flutter-logo.png",
        items: [flutterSticker, imglySticker]);

    /// A predefined category.
    final emoticons =
        StickerCategory.existing("imgly_sticker_category_emoticons");

    /// A customized predefined category.
    final shapes =
        StickerCategory.existing("imgly_sticker_category_shapes", items: [
      Sticker.existing("imgly_sticker_shapes_badge_01"),
      Sticker.existing("imgly_sticker_shapes_arrow_02")
    ]);

    /// A GIPHY sticker category.
    // final giphy = StickerCategory.giphy(
    //     GiphyStickerProvider("YOUR-GIPHY-API-KEY"));

    var categories = <StickerCategory>[logos, emoticons, shapes];
    final configuration = Configuration(
        sticker:
            StickerOptions(personalStickers: true, categories: categories));
    return configuration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Inshot'),
        centerTitle: false,
        actions: const [
          InkWell(
            child: Icon(Icons.settings),
          ),
          SizedBox(width: 16)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder(
              future: Future.delayed(Duration(seconds: 10), () {
                GetAudios().loadData();
              }),
              builder: (context, snapshot) {
                final List<FileSystemEntity> entities =
                    snapshot.hasData ? snapshot.data! : [];
                final List<AudioClip> audioClips = [];
                for (var element in entities) {
                  final name = element.path.split('/').last;
                  audioClips.add(AudioClip(name, element.path));
                }
                final audioOptions = AudioOptions(categories: [
                  AudioClipCategory(
                    "device",
                    "My Device",
                    items: audioClips,
                  )
                ], canvasActions: [
                  AudioCanvasAction.delete,
                  AudioCanvasAction.playPause
                ]);
                configuration = Configuration(audio: audioOptions);
                return SizedBox();
              },
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create new',
                  style: GoogleFonts.poppins(),
                ),
                const SizedBox(height: 10),
                CreateElelement(
                  onTap: () async {
                    // final XFile? galleryVideo = await ImagePicker()
                    //     .pickVideo(source: ImageSource.gallery);
                    // VESDK.openEditor(
                    //   Video(galleryVideo!.path),
                    //   configuration: createConfiguration(),
                    // );

                    VESDK.openEditor(Video("assets/video.mp4"));
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.amber[300],
              height: 100,
              width: double.infinity,
              child: Text('Hien thi quang cao'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
