import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerDisplay extends StatelessWidget {
  final String time;
  final bool isVisible;

  const TimerDisplay({
    Key? key,
    required this.time,
    this.isVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();
    
    return Text(
      time,
      style: GoogleFonts.robotoMono(
        fontSize: 120,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
