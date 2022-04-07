import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thumbprint/presentation/features/onboarding/get_started_screen.dart';
import '../../../core/utils/consts.dart';
import '../../../data/api/auth_manager.dart';
import '../../../data/models/user.dart';
import '../../../data/requests/User_VM.dart';
import '../../controllers/user_controller.dart';
import '../Notifications/Notifications.dart';
import '../Profile/Profile.dart';
import '../Settings/Setting.dart';
import '../VoteScreen/vote_screen.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  late Future<User> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = UserVM().getUserDetails();
  }

  double xOffset = 0;
  double yOffset = 0;
  bool dark = false;
  bool isDrawerOpen = false;

  final AuthenticationManager _authManager = Get.find();
  final UserController controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D243C) : const Color(0xFFF1F3F6),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: isDark ? const Color(0xFF113050) : const Color(0xFFF1F3F6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FutureBuilder<User>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 70.h),
                                child: Container(
                                  width: 200.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? const Color(0xFF0D243C)
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50.r),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 70.h),
                                child: Container(
                                  width: 200.w,
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? const Color(0xFF0D243C)
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50.r),
                                    ),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: CircleAvatar(
                                          backgroundColor: const Color(0xFFE5E5E5),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(20.r),
                                            child: Initicon(
                                              size: 45,
                                              color: isDark
                                                  ? bluetext
                                                  : const Color(0xFF133252),
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              text: snapshot.data!.data!.name,
                                              backgroundColor: isDark
                                                  ? const Color(0xFF133252)
                                                  : bluetext,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 36.h,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 120,
                                              child: Text(
                                                snapshot.data!.data!.name!,
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: isDark
                                                        ? Colors.white
                                                        : const Color(0xFF656565),
                                                    fontSize: 15.sp,
                                                    fontFamily: 'Roboto',
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              child: Text(
                                                '${snapshot.data!.data!.email}',
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: isDark
                                                        ? Colors.white
                                                        : const Color(0xFF656565),
                                                    fontSize: 10.sp,
                                                    fontFamily: 'Roboto',
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Text(
                              "Failed to Load",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: 70.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          selectedTileColor: Colors.blueGrey.shade200,
                          title: const Text('Home',
                              style: TextStyle(color: Colors.lightBlue)),
                          focusColor: Colors.blueGrey.shade200,
                        ),
                        ListTile(
                          selectedTileColor: Colors.blueGrey.shade200,
                          title: const Text('Profile',
                              style: TextStyle(color: Colors.lightBlue)),
                          focusColor: Colors.blueGrey.shade200,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()));
                          },
                        ),
                        ListTile(
                            selectedTileColor: Colors.blueGrey.shade200,
                            title: const Text('Election',
                                style: TextStyle(color: Colors.lightBlue)),
                            focusColor: Colors.blueGrey.shade200,
                            onTap: () {
                              showDialog(
                                  barrierColor: Colors.black54,
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        backgroundColor: isDark
                                            ? const Color(0xFF133252)
                                            : const Color(0xFFF1F3F6),
                                        contentTextStyle: TextStyle(
                                            color: isDark
                                                ? headingColorDark
                                                : headingColorLight),
                                        contentPadding: const EdgeInsets.fromLTRB(
                                            30.0, 20.0, 35.0, 24.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        title: const Text('Ongoing Election'),
                                        titleTextStyle: GoogleFonts.roboto(
                                            color: isDark ? blue : black,
                                            fontWeight: FontWeight.bold),
                                        content: const Text(
                                            'You are about to embark on an ongoing E-ELECTION, once you accept to be in this election there is no going back you will have to vote.\n\nRemeber your vote counts'),
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30, top: 20, bottom: 40),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: isDark
                                                                  ? grey
                                                                  : thumbprintblue),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5)),
                                                      child: const Center(
                                                        child: Text(
                                                          'Decline',
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const VoteScreen()));
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: isDark
                                                                  ? grey
                                                                  : thumbprintblue),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5)),
                                                      child: const Center(
                                                          child: Text(
                                                            'Accept',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]);
                                  });
                            }),
                        ListTile(
                          selectedTileColor: Colors.blueGrey.shade200,
                          title: const Text('Settings',
                              style: TextStyle(color: Colors.lightBlue)),
                          focusColor: Colors.blueGrey.shade200,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Settings()));
                          },
                        ),
                        ListTile(
                          selectedTileColor: Colors.blueGrey.shade200,
                          title: const Text('Notifications',
                              style: TextStyle(color: Colors.lightBlue)),
                          focusColor: Colors.blueGrey.shade200,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NotificationScreen()));
                          },
                        ),
                        SizedBox(
                          height: 150.h,
                        ),
                        //     Switch.adaptive(
                        //        value: isDarkMode,
                        //       onChanged: (isLightMode) {
                        //         setState(() {
                        //          isDarkMode = isLightMode;
                        //       // isDarkMode = false;
                        //     });
                        //      }),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/icons/power_switch.svg",
                              color: Colors.lightBlue,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                    color: isDark
                                        ? Colors.white
                                        : const Color(0xFF656565),
                                    fontFamily: 'Roboto',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () async {
                                _authManager.logOut();
                                print( _authManager.getToken());
                                Get.offAll(const GetStartedScreen());
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
