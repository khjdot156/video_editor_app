import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_editor_app/helper/utils.dart';

import 'item_setting.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[400],
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          //pro
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inshot Pro',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_pro.png',
                  title: 'Join Inshot Pro',
                  isMore: true,
                  onTap: () => Utils().showProScreen(context),
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_restorepurchases.png',
                  title: 'Restore Purchases',
                  isMore: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
          //General
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                ItemSettings(
                  icon: 'assets/icons/icon_videosetting.png',
                  title: 'Video Setting',
                  isMore: true,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_clear_cache.png',
                  title: 'Clear Cache',
                  isMore: false,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_language.png',
                  title: 'Language',
                  subTitle: 'English',
                  isMore: true,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_q_a.png',
                  title: 'Q&A',
                  isMore: true,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_find_ideas.png',
                  title: 'Find Ideas',
                  isMore: true,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_feedback.png',
                  title: 'Send Feedback',
                  isMore: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
          //Follow us
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Follow us (Get more tutorials)',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_youtube.png',
                  title: 'Youtube',
                  isMore: false,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_tiktok.png',
                  title: 'Tiktok',
                  isMore: false,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_share.png',
                  title: 'Invite Friends',
                  isMore: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
          //Others
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Others',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_privacy.png',
                  title: 'Privacy & Terms',
                  isMore: true,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ItemSettings(
                  icon: 'assets/icons/icon_setting_ver.png',
                  title: 'Inshot 1.95.33',
                  subTitle: "You're in the lastest version!",
                  isMore: false,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
