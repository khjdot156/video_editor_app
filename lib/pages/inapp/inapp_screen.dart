import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import 'item_pro.dart';

class InappScreen extends StatefulWidget {
  const InappScreen({super.key});

  @override
  State<InappScreen> createState() => _InappScreenState();
}

class _InappScreenState extends State<InappScreen> {
  int indexTicked = 0;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/inshot_pro.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: 0.8,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
              title: Text(
                'Inshot Pro',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text(
                //   'Back-to-school',
                //   style: GoogleFonts.poppins(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.white,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Access to all Paid Transitions, Effects, Stickers and more. No Inshot Logo, No ads',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Text(
                //   '13 days left',
                //   style: GoogleFonts.poppins(
                //     fontSize: 14,
                //     fontWeight: FontWeight.w500,
                //     color: Colors.amber[400],
                //   ),
                // ),
                const SizedBox(height: 10),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          3,
                          (index) => ItemPro(
                            ticked: index == indexTicked,
                            title: '2244.dd',
                            subTitle: 'then 2343/year',
                            onTap: () {
                              setState(() {
                                indexTicked = index;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Colors.red.shade400,
                              Colors.red.shade600,
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Continue',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'With a subscription, you get unlimited access to all paid content of InShot. Subscription is billed monthly or annually (as show above) automatically after the trial (if available) and charged through your Google Play account. You can manage or cancel your subscriptions through Google Play Store anytime. Subscription is not required to use inShot. ',
                              style: GoogleFonts.poppins(
                                fontSize: 8,
                                color: Colors.grey[400],
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of use',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Tap Here onTap'),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: GoogleFonts.poppins(
                                fontSize: 8,
                                color: Colors.grey[400],
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy policy',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Tap Here onTap'),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: GoogleFonts.poppins(
                                fontSize: 8,
                                color: Colors.grey[400],
                              ),
                            ),
                            TextSpan(
                              text: 'Already purchased?',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Tap Here onTap'),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
