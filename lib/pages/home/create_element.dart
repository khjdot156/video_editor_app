import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateElelement extends StatelessWidget {
  final VoidCallback? onTap;
  const CreateElelement({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.deepOrange[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange[300],
              ),
              child: const Icon(
                Icons.video_call_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text('Video',style: GoogleFonts.poppins(),),
          ],
        ),
      ),
    );
  }
}
