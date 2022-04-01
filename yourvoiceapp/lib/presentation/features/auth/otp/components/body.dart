import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/toast.dart';
import '../../../create_new_password/create_password_screen.dart';
import 'otp_form.dart';

class OtpBody extends StatelessWidget {
  final _otpcontroller1 = TextEditingController();
  final _otpcontroller2 = TextEditingController();
  final _otpcontroller3 = TextEditingController();
  final _otpcontroller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.07.sh,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.03.sw,
                    ),
                    SvgPicture.asset(
                      "assets/icons/app_icon.svg",
                      color: isDark ? Colors.white : const Color(0xFF6B6B6B),
                      width: 44,
                      height: 46,
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
                SizedBox(height: 0.1.sh),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter security code!",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Roboto',
                            color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.03.sh,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 400,
                    child: Text(
                      "Please check your emails for a message with your code. Your code is 4 numbers long.",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                OtpForm(
                  otpctrl1: _otpcontroller1,
                  otpctrl2: _otpcontroller2,
                  otpctrl3: _otpcontroller3,
                  otpctrl4: _otpcontroller4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Didnt get code?',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF3BAFDA),
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                fontStyle: FontStyle.italic),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 56.0,
                  child: ElevatedButton(
                    onPressed: () {
                      var otpCode = _otpcontroller1.text.toString() +
                          _otpcontroller2.text.toString() +
                          _otpcontroller3.text.toString() +
                          _otpcontroller4.text.toString();
                      print(otpCode);
                      // ignore: unrelated_type_equality_checks
                      if (otpCode == "1234") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateNewPasswordScreen()));
                      } else {
                        showToast('otp incorrect', Colors.red);
                      }
                    },
                    child: const Text(
                      'Proceed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Roboto'),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF2706F4),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white,
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toString()}",
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
