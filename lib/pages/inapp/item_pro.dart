import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemPro extends StatelessWidget {
  final bool ticked;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const ItemPro({
    super.key,
    required this.ticked,
    required this.title,
    required this.subTitle, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ticked ? Colors.grey[300] : Colors.white,
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            ticked
                ? const Icon(Icons.radio_button_checked)
                : const Icon(Icons.radio_button_unchecked),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    fontSize: 10,
                    color: Colors.red[200],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
