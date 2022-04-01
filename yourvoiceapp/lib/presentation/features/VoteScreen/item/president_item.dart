import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thumbprint/data/models/candidates.dart';

class PresidentItem extends StatelessWidget{

  final President president;

  const PresidentItem({Key? key, required this.president}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(
          top: 10, left: 10, right: 10),
      child: Container(
        height: 60.78.h,
        decoration: isDark
            ? BoxDecoration(
          gradient:
          const LinearGradient(
            begin: Alignment
                .topRight,
            end: Alignment
                .bottomLeft,
            stops: [
              0,
              3,
            ],
            colors: [
              Color(0xFF133252),
              Color(0xFF0A1D31)
            ],
          ),
          borderRadius:
          BorderRadius
              .circular(10),
        )
            : BoxDecoration(
            borderRadius:
            BorderRadius
                .circular(10),
            color: Colors.white),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: isDark
                  ? Colors.white
                  : const Color(0xFFD0F0FE),
              child: Image.asset(
                  'assets/images/avatar.png'),
            ),
            title: Text(
              president.name!,
              style: GoogleFonts.workSans(
                  fontSize: 15,
                  fontWeight:
                  FontWeight.w500,
                  color: isDark
                      ? Colors.white
                      : const Color(
                      0xFF200E32)),
            ),
            subtitle: Text(
              'Winner!',
              style: GoogleFonts.workSans(
                  fontSize: 15,
                  color: isDark
                      ? const Color(
                      0xFFF1F1F1)
                      : const Color(
                      0xFF6B6B6B)),
            ),
            trailing: Text(
                ' ${president.vote!.voteCount}\nvotes'),
          ),
        ),
      ),
    );
  }

}