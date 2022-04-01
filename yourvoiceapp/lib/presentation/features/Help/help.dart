import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../core/utils/consts.dart';
import 'components/Terms and privacy policy.dart';
import 'components/app_info.dart';
import 'components/contactUs.dart';
import 'components/legal.dart';
import 'components/rating.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D243C) : const Color(0xFFF1F3F6),
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/back.png',
            color: isDark ? Colors.white : Colors.black,
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
              'About thumbprint',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
            SvgPicture.asset("assets/icons/union.svg"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const AppInfo()));
                    },
                    child: Text(
                      'App info',
                      style: GoogleFonts.workSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark ? specialtext : headingColorLight),
                    )),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Rating()));
                    },
                    child: Text(
                      'Rate App',
                      style: GoogleFonts.workSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark ? specialtext : headingColorLight),
                    )),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactUs()));
                    },
                    child: Text(
                      'Contact us',
                      style: GoogleFonts.workSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark ? specialtext : headingColorLight),
                    )),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermsAndPrivacyPolicy()));
                    },
                    child: Text(
                      'Terms and Privacy Policy',
                      style: GoogleFonts.workSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark ? specialtext : headingColorLight),
                    )),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Legal()));
                    },
                    child: Text(
                      'Legal',
                      style: GoogleFonts.workSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isDark ? specialtext : headingColorLight),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
