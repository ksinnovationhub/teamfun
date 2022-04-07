import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:thumbprint/presentation/features/onboarding/get_started_screen.dart';


import '../../../core/utils/consts.dart';
import '../Help/help.dart';
import '../auth/reset_password/password_reset_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool tapped1 = true;
  bool tapped2 = true;
  bool tapped3 = false;
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
              'Settings',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: Text(
                    'General Settings',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDark ? specialtext : headingColorLight),
                  ),
                  subtitle: Text(
                    'password reset',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PasswordResetScreen()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.blueGrey,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: Text(
                    'Security',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDark ? specialtext : headingColorLight),
                  ),
                  subtitle: Text(
                    'show security notifications',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: green,
                    value: tapped1,
                    onChanged: (bool values) {
                      setState(() {
                        tapped1 = values;
                      });
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.blueGrey,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: Text(
                    'Notifications',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDark ? specialtext : headingColorLight),
                  ),
                  subtitle: Text(
                    'Election messages',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: green,
                    value: tapped2,
                    onChanged: (bool values) {
                      setState(() {
                        tapped2 = values;
                      });
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.blueGrey,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: Text(
                    'Deactivate my account',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDark ? specialtext : headingColorLight),
                  ),
                  subtitle: Text(
                    'Privacy',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey),
                  ),
                  trailing: CupertinoSwitch(
                    activeColor: green,
                    value: tapped3,
                    onChanged: (bool value) {
                      setState(() {
                        tapped3 = value;
                      });
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.blueGrey,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor:
                            isDark ? scaffoldColorDark : scaffoldColorlight,
                        barrierColor: Colors.black87,
                        isDismissible: false,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(40))),
                        context: context,
                        builder: (context) => SizedBox(
                              height: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 10.h),
                                        Center(
                                          child: Divider(
                                            color:
                                                isDark ? specialtext : black,
                                            thickness: 5,
                                            indent: 200.0,
                                            endIndent: 200.0,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 50, bottom: 50),
                                          child: Center(
                                              child: Icon(
                                            CupertinoIcons.delete_solid,
                                            size: 100,
                                          )),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            'Are you sure you want to\n    delete your account?',
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Center(
                                            child: SizedBox(
                                              width: 220.w,
                                              height: 45.h,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor: isDark
                                                          ? const Color(0xFF0D243C)
                                                          : Colors.white,
                                                      barrierColor:
                                                          scaffoldColorDark,
                                                      context: context,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        40.0)),
                                                      ),
                                                      builder:
                                                          (BuildContext bc) {
                                                        return SizedBox(
                                                          height: double
                                                              .maxFinite,
                                                          child: Center(
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Divider(
                                                                      color:
                                                                          black,
                                                                      thickness:
                                                                          4,
                                                                      indent:
                                                                          200.0,
                                                                      endIndent:
                                                                          200.0,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                        80,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 0,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        "assets/icons/info1.png",
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        color: Colors
                                                                            .green
                                                                            .shade800,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                        50,
                                                                  ),
                                                                  Center(
                                                                      child:
                                                                          SizedBox(
                                                                    width:
                                                                        300,
                                                                    child:
                                                                        Text(
                                                                      'Account has been deleted successfully',
                                                                      textAlign:
                                                                          TextAlign.center,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: isDark
                                                                              ? Colors.white
                                                                              : const Color(0xFF6B6B6B)),
                                                                    ),
                                                                  )),
                                                                  const SizedBox(
                                                                    height:
                                                                        30,
                                                                  ),
                                                                  Center(
                                                                      child:
                                                                          SizedBox(
                                                                    width:
                                                                        200,
                                                                    child:
                                                                        Text(
                                                                      'Thanks for using thumbprint .',
                                                                      textAlign:
                                                                          TextAlign.center,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color: isDark
                                                                              ? Colors.white
                                                                              : const Color(0xFF6B6B6B)),
                                                                    ),
                                                                  )),
                                                                  const SizedBox(
                                                                    height:
                                                                        10,
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                        10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            30),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                        Navigator.pushReplacement(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => const GetStartedScreen()));
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            180,
                                                                        decoration: BoxDecoration(
                                                                            border: Border.all(color: isDark ? grey : black),
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                        child:
                                                                            const Center(
                                                                          child:
                                                                              Text(
                                                                            'OK',
                                                                            style: TextStyle(fontSize: 18),
                                                                          ),
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
                                                child: Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14.sp,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                style:
                                                    ElevatedButton.styleFrom(
                                                  primary: Colors.red[700],
                                                  shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                      .circular(
                                                                  14.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(30),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: isDark
                                                          ? grey
                                                          : black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                              child: const Center(
                                                child: Text(
                                                  'Cancel',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: ListTile(
                    title: Text(
                      'Delete my account',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: isDark ? specialtext : headingColorLight),
                    ),
                    subtitle: Text(
                      'Privacy',
                      style: GoogleFonts.montserrat(
                          letterSpacing: 1,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.blueGrey,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  selectedTileColor: Colors.orange,
                  title: Text(
                    'Help',
                    style: TextStyle(
                        color: isDark ? specialtext : headingColorLight),
                  ),
                  focusColor: Colors.blueGrey.shade200,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const About()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
