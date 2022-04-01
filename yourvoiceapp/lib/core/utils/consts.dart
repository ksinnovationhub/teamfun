import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool check = true;
bool isDarkMode = true;

Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();
Color scaffoldColorDark = const Color(0xFF0D243C);
Color scaffoldColorlight = Colors.white;
Color headingColorLight = const Color(0xFF6B6B6B);
Color headingColorDark = Colors.white;
Color textfieldcolor = const Color(0xFF6B6B6B);
Color buttonColor = const Color(0xFF008751);
Color generaltextColor = Colors.white;
Color lightthemetextColor = const Color(0xFF6B6B6B);
Text appname = Text('ThumbPrint',
    style: GoogleFonts.workSans(
      fontSize: 19,
      fontWeight: FontWeight.w500,
    ));
Color specialtext = const Color.fromRGBO(255, 255, 255, 60);
Color specialContainerColor = const Color.fromRGBO(255, 255, 255, 60);
Color bluetext = const Color(0xFF3BAFDA);
Color black = Colors.black;
Color white = Colors.white;
Color blue = Colors.blue;
Color lightblue = Colors.lightBlue;
Color thumbprintblue = const Color(0xFF2706F4);
Color specialblue = const Color(0xFFF1F3F6);
Color grey = const Color(0xFFC4C4C4);
Color green = Colors.green;
Color orange = const Color(0xFFFFAC30);
Color lightblue1 = const Color(0xFF96C0FF);
Color red = const Color(0xFFDF2020);
