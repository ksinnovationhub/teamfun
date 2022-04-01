import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thumbprint/presentation/controllers/sign_up_controller.dart';
import 'package:thumbprint/presentation/features/auth/login/login_screen.dart';


import '../../../../core/utils/consts.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../core/widgets/validators.dart';
import '../../../../data/requests/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordvisible = true;
  var incorrect = const Icon(
    Icons.close,
    color: Colors.red,
  );

  final SignUpController controller = Get.find();

  final _fullNamecontroller = TextEditingController();
  final _phonenumbercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordvisible = true;
  }

  final GlobalKey _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.06.sh,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  "assets/icons/app_icon.svg",
                  width: 44,
                  height: 46,
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
              height: 0.07.sh,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Sign Up",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: isDark ? Colors.white : const Color(0xFF6B6B6B))),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: 350,
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey),
                    )),
              ],
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF9F9C9C),
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.lightBlue),
                            controller: _fullNamecontroller,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                                hintText: 'Voter Identification Number',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 18)),
                            textInputAction: TextInputAction.next,
                            cursorColor: buttonColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF9F9C9C),
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: TextFormField(
                              onChanged: (_phonenumbercontroller) {
                                setState(() => _phonenumbercontroller);
                              },
                              style: const TextStyle(color: Colors.green),
                              keyboardType: TextInputType.number,
                              controller: _phonenumbercontroller,
                              decoration: InputDecoration(
                                  suffixIcon: Validators.isPhonenumbber(
                                              _phonenumbercontroller.text
                                                  .toString()
                                                  .trim()) ==
                                          true
                                      ? const Icon(Icons.check, color: Colors.green)
                                      : _phonenumbercontroller.text
                                              .toString()
                                              .trim()
                                              .isEmpty
                                          ? const Icon(
                                              Icons.close,
                                              color: Colors.transparent,
                                            )
                                          : incorrect,
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintText: 'Phone Number',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 18)),
                              textInputAction: TextInputAction.next,
                              cursorColor: buttonColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF9F9C9C),
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: TextField(
                            style: const TextStyle(color: Colors.green),
                            onChanged: (emailCtrl) {
                              setState(() => emailCtrl);
                            },
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                                labelStyle: const TextStyle(color: Colors.grey),
                                suffixIcon: Validators.isEmail(_emailcontroller
                                            .text
                                            .toString()
                                            .trim()) ==
                                        true
                                    ? const Icon(Icons.check, color: Colors.green)
                                    : _emailcontroller.text
                                            .toString()
                                            .trim()
                                            .isEmpty
                                        ? const Icon(
                                            Icons.close,
                                            color: Colors.transparent,
                                          )
                                        : incorrect,
                                border: InputBorder.none,
                                counterText: "",
                                hintText: 'Email Address',
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 18)),
                            textInputAction: TextInputAction.next,
                            cursorColor: buttonColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF9F9C9C),
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: TextField(
                            style: const TextStyle(color: Colors.green),
                            obscureText: passwordvisible ? true : false,
                            obscuringCharacter: '*',
                            controller: _passwordcontroller,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        passwordvisible
                                            ? passwordvisible = false
                                            : passwordvisible = true;
                                      });
                                    },
                                    child: passwordvisible
                                        ? const Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: Colors.green,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.eyeSlash,
                                            size: 20,
                                          )),
                                border: InputBorder.none,
                                counterText: "",
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 18)),
                            textInputAction: TextInputAction.next,
                            cursorColor: buttonColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_fullNamecontroller.text.isEmpty ||
                          _phonenumbercontroller.text.isEmpty ||
                          _emailcontroller.text.isEmpty ||
                          _passwordcontroller.text.isEmpty) {
                        showToast("Please fill all fields", Colors.red);
                      } else if (Validators.isPhonenumbber(
                                  _phonenumbercontroller.text
                                      .toString()
                                      .trim()) ==
                              false ||
                          Validators.isEmail(
                                  _emailcontroller.text.toString().trim()) ==
                              false) {
                        showToast('please input valid credentials', Colors.red);
                      } else {
                        controller.registerUser(
                            _fullNamecontroller.text.toString().trim(),
                            _phonenumbercontroller.text.toString().trim(),
                            _emailcontroller.text.toString().trim(),
                            _passwordcontroller.text.toString().trim(),
                            );
                      }
                    },
                    child: Container(
                      height: 59,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: buttonColor),
                      child: const Center(
                        child: Text(
                          'Proceed',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
      ),
      backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white,
    );
  }
}
