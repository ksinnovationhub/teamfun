import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../core/utils/consts.dart';

class Legal extends StatefulWidget {
  const Legal({Key? key}) : super(key: key);

  @override
  _LegalState createState() => _LegalState();
}

class _LegalState extends State<Legal> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: scaffoldColorlight,
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
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: scaffoldColorDark,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Terms and Privacy Policy',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey.shade100,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Terms and Privacy Policy',
                        style: GoogleFonts.workSans(
                            color: scaffoldColorDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    SvgPicture.asset("assets/icons/union.svg"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Thumbprint Legal',
                    style: GoogleFonts.workSans(
                        color: scaffoldColorDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Text(
                        ' 1.key updates \n 2.Terms of service \n 3.Privacy policy \n 4.Privacy shield \n 5.Cookies \n 6.Payments',
                        style: GoogleFonts.workSans(
                            color: bluetext, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Key Updates',
                    style: GoogleFonts.workSans(
                        color: scaffoldColorDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Text(
                        'At Election Runner, we collect and manage user data according to the following Privacy Policy, with the goal of incorporating our company values: transparency, accessibility, sanity, usability. This document is part of Election Runners Terms of Service, and by using ElectionRunner.com (the Website), you agree to the terms of this Privacy Policy and the Terms of Service. Please read the Terms of Service in their entirety and refer to those for definitions and contacts.',
                        style: GoogleFonts.workSans(
                            color: bluetext, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
            ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
