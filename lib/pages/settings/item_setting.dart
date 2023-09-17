import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSettings extends StatelessWidget {
  final String icon;
  final String title;
  final String? subTitle;
  final bool isMore;
  final VoidCallback onTap;
  const ItemSettings({
    super.key,
    required this.icon,
    required this.title,
    this.subTitle,
    this.isMore = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 24,
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
            ],
          ),
          const Spacer(),
          if (isMore)
            Image.asset(
              'assets/icons/icon_setting_arrow.png',
              width: 24,
            ),
        ],
      ),
    );
  }
}
