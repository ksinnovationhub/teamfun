import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../auth/login/login_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  _CreateNewPasswordScreenState createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.07.sh,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 0.04.sw,
                  ),
                  SvgPicture.asset(
                    "assets/icons/app_icon.svg",
                    width: 50,
                    height: 50,
                    color: isDark ? Colors.white : const Color(0xFF6B6B6B),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "ThumbPrint",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                  ),
                ],
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 0.04.sw,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Reset your Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 0.04.sw,
                  ),
                  Container(
                      width: 350,
                      child: Text(
                        'Pls create a password you can remember',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                      )),
                ],
              ),
              SizedBox(
                height: 0.1.sh,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF9F9C9C)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: TextField(
                          style: TextStyle(color: Colors.lightBlue),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              hintText: 'Enter New Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.04.sh,
                    ),
                    Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF9F9C9C)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: TextField(
                          style: TextStyle(color: Colors.lightBlue),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              hintText: 'Confirm New Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.1.sh,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor:
                          isDark ? const Color(0xFF091A2C) : Colors.white,
                      elevation: 200,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      builder: (BuildContext bc) {
                        return Container(
                          height: 450,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const Center(
                                    child: Divider(
                                      color: Colors.blueGrey,
                                      thickness: 2,
                                      indent: 160,
                                      endIndent: 160,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/info1.png",
                                        width: 80,
                                        height: 80,
                                        color: isDark
                                            ? const Color(0xFFA5DC86)
                                            : Colors.green[800],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                      child: Text(
                                    'Password Reset',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? Colors.white
                                            : const Color(0xFF6B6B6B)),
                                  )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: SizedBox(
                                    width: 200,
                                    child: Text(
                                        'Your password has been reset successfully, kindly login to access your dashboard.',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            color: isDark
                                                ? Colors.white
                                                : const Color(0xFF6B6B6B),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15)),
                                  )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const LoginScreen()));
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue.shade800),
                                      child: const Center(
                                        child: Text(
                                          'Next',
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }); // OTP code resend
                },
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF2706F4)),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.03.sh,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Oops, I remember my details',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFF3BAFDA),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white);
  }
}
