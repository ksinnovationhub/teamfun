import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thumbprint/data/api/auth_manager.dart';
import 'package:thumbprint/data/cache/cache_manager.dart';
import 'package:thumbprint/presentation/controllers/user_controller.dart';
import 'dart:math';
import '../../../data/models/user.dart';
import 'package:thumbprint/data/cache/cache_manager.dart';
import '../Home/components/card_content.dart';
import '../Home/components/poll_progressbars.dart';
import '../Settings/Setting.dart';
import '../side_bar/drawer_screen.dart';
import 'components/poll_cards.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final UserController controller = Get.put(UserController());

  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  void initState() {

    super.initState();
  }

  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
   print(AuthenticationManager().getToken());

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          const DrawerScreen(),
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(isDrawerOpen ? 0.90 : 1.00)
              ..rotateZ(isDrawerOpen ? pi / 20 : 0),
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              //CHANGE THEME COLOR
              color: isDark ? const Color(0xFF0D243C) : Colors.white,
              borderRadius: isDrawerOpen
                  ? BorderRadius.circular(40.r)
                  : BorderRadius.circular(0.r),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 15.h),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          isDrawerOpen
                              ? GestureDetector(
                                  child: SizedBox(
                                      width: 37.w,
                                      height: 38.h,
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: isDark
                                            ? Colors.white
                                            : const Color(0xFF0D243C),
                                      )),
                                  onTap: () {
                                    setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      isDrawerOpen = false;
                                    });
                                  },
                                )
                              : GestureDetector(
                                  child: SizedBox(
                                    width: 37.w,
                                    child: SvgPicture.asset(
                                        "assets/icons/app_icon.svg",
                                        color: isDark
                                            ? Colors.white
                                            : const Color(0xFF6B6B6B)),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      xOffset = 290;
                                      yOffset = 100;
                                      isDrawerOpen = true;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: 272.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Settings()));
                            },
                            child: SizedBox(
                              width: 19.w,
                              height: 19.h,
                              child: SvgPicture.asset("assets/icons/union.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Account Overview",
                          style: TextStyle(
                              fontFamily: 'WorkSans',
                              color: isDark ? Colors.white : const Color(0xFF6B6B6B),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                         CardContent(),
                        SizedBox(height: 36.h),
                        Text(
                          "Polls",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: isDark ? Colors.blue : const Color(0xFF6B6B6B),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        const PollCards(),
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Top ranking candidates",
                              style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color:
                                      isDark ? Colors.blue : const Color(0xFF6B6B6B)),
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "View all",
                                style: TextStyle(
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const PollProgressBars(),
                        SizedBox(
                          height: 50.h,
                        ),
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
