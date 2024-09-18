import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceItem extends StatelessWidget {
  String text;
  bool isSelected;

  SourceItem(
    this.text,
    this.isSelected,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF39A552),
        ),
        borderRadius: BorderRadius.circular(24),
        color: isSelected ? Color(0xFF39A552) : Colors.transparent,
      ),
      child: Text(
        text,
        style: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.w200,
          color: isSelected ? Colors.white : Color(0xFF39A552),
        ),
      ),
    );
  }
}
