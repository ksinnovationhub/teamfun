import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../../../core/utils/consts.dart';
import '../../../../core/widgets/toast.dart';
import '../../../../core/widgets/validators.dart';
import '../../../../data/requests/auth_service.dart';
import '../../../controllers/login_controller.dart';
import '../reset_password/password_reset_screen.dart';
import '../sign_up/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var incorrect = const Icon(
    Icons.close,
    color: Colors.red,
  );
  final _formKey = GlobalKey<FormState>();
  final LoginController controller = Get.find();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passwordvisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordvisible = true;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 0.07.sh,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.05.sw,
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
                  height: 0.09.sh,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.07.sw,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.09.sh,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Form(
                    autovalidateMode: AutovalidateMode.disabled, key: _formKey,
                    child: Column(
                      children: [
                        Container(
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
                              style: const TextStyle(color: Colors.black87),
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Voter identification Number',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 18)),
                              textInputAction: TextInputAction.next,
                              cursorColor: buttonColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.04.sh,
                        ),
                        Container(
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
                              style: const TextStyle(color: Colors.black87),
                              obscureText: passwordvisible ? true : false,
                              keyboardType: TextInputType.text,
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                                hintText: 'Password',
                                hintStyle:
                                    const TextStyle(color: Colors.grey, fontSize: 18),
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
                                            color: Color(0xFF008751),
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.eyeSlash,
                                            size: 20,
                                          )),
                              ),
                              textInputAction: TextInputAction.done,
                              cursorColor: buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              side: const BorderSide(
                                color: Color(0xFF9F9C9C),
                              ),
                              value: check,
                              activeColor: Colors.green,
                              checkColor: Colors.blueGrey.shade200,
                              onChanged: (bool? value) {
                                setState(() {
                                  check = value!;
                                });
                              }),
                          const Text(
                            'Remember Me',
                            style: TextStyle(color: Color(0xFF008751)),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PasswordResetScreen()));
                        },
                        child: Text(
                          'Forgot Password',
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF008751),
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.09.sh,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            showToast("Please fill all fields", Colors.red);
                          } else if (Validators.isEmail(
                                  _emailController.text.toString().trim()) ==
                              false) {
                            showToast(
                                'please input valid credentials', Colors.red);
                          } else {
                           controller.loginUser(
                                _emailController.text.toString(),
                                _passwordController.text.toString(),
                                );
                          }
                        },
                        child: Container(
                          height: 59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xFF008751)),
                          child: const Center(
                            child: Text(
                              'Sign in',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const SignupScreen()));
                      },
                      child: Text(
                        'Don’t have an account? Signup',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF008751),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: isDark ? const Color(0xFF0D243C) : Colors.white,
    );
  }
}
