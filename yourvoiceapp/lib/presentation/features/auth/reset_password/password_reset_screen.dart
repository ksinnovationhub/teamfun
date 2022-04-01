import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../otp/otp_screen.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Column(
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
                "YourVoice",
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
                  "Forgot Password?",
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
              SizedBox(
                  width: 350,
                  child: Text(
                    'Enter your Email so that we can send the password to you.',
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
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.lightBlue),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                          hintText: 'Email Address',
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
                  backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white,
                  elevation: 200,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0)),
                  ),
                  builder: (BuildContext bc) {
                    return SizedBox(
                      height: 450,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Center(
                                child: Divider(
                                  color: Colors.blueGrey,
                                  thickness: 2,
                                  indent: 150.0,
                                  endIndent: 150.0,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
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
                                    color: Colors.green.shade800,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                  child: Text(
                                'Email Sent',
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
                                  'Check your mail and open the link or use OTP code sent to your number to continue.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: isDark
                                          ? Colors.white
                                          : const Color(0xFF6B6B6B)),
                                ),
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
                                          builder: (context) => const OtpScreen()));
                                },
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFF008751)),
                                  child: const Center(
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
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
                  color: const Color(0xFF008751)),
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
              Navigator.pop(context);
            },
            child: Text(
              'Oops, I remember my details',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF008751)),
            ),
          )
        ],
      ),
      backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white,
    );
  }
}
