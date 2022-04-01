import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/login/login_screen.dart';
import '../auth/sign_up/signup_screen.dart';


class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        body: Row(
          children: <Widget>[
            SizedBox(
              width: 104,
              height: double.maxFinite,
              child: Image.asset(
                "assets/images/imgintro.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(30)),
            Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 0.2.sh),
                      SvgPicture.asset(
                        "assets/icons/app_icon.svg",
                        width: 44,
                        height: 46.37,
                        color: isDark ? Colors.white : const Color(0xFF6B6B6B),
                      ),
                      SizedBox(height: 0.05.sh),
                      Text(
                        "Welcome to",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Text(
                        "YourVoice",
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: 189,
                        height: 44,
                        child: Text(
                          "Open An Account For Digital electronic voting.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? const Color(0xFF7B7F9E)
                                  : const Color(0xFF7B7F9E)),
                        ),
                      ),
                      SizedBox(height: 0.25.sh),
                      GestureDetector(
                        onTap: () {},
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            width: 200.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF008751)),
                            child: InkWell(
                              //splashColor: Colors.white,
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "Sign in",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      "assets/icons/forward_icon.svg")
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginScreen()));
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 27),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 70.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Join For Free.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7B7F9E)),
                              ),
                              const SizedBox(height: 2),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignupScreen()));
                                },
                                child: Text("Create an account!",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: isDark
                                            ? Colors.white
                                            : const Color(0xFF242424))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white);
  }
}
