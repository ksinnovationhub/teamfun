import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../core/utils/consts.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? scaffoldColorDark : scaffoldColorlight,
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/back.png',
            color: isDark ? generaltextColor : lightthemetextColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'App Info',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
            SvgPicture.asset("assets/icons/union.svg"),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Container(
                child: Column(
                  children: [
                    Text('ThumbPrint',
                        style: GoogleFonts.workSans(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: isDark ? specialtext : headingColorLight)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('version:  2.21.10.16',
                          style: GoogleFonts.workSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: isDark ? specialtext : headingColorLight)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40, top: 20),
                      child: SvgPicture.asset(
                        "assets/icons/app_icon.svg",
                        color: isDark ? headingColorDark : headingColorLight,
                        width: 125,
                        height: 131.27,
                      ),
                    ),
                    Text('@2019-2021 Thumbprint Inc.',
                        style: GoogleFonts.workSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: isDark ? specialtext : headingColorLight)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('LICENSES',
                            style: GoogleFonts.workSans(
                                decoration: TextDecoration.underline,
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:
                                    isDark ? specialtext : headingColorLight)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
