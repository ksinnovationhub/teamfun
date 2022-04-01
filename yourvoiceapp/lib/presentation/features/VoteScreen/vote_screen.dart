import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thumbprint/presentation/features/VoteScreen/results.dart';


import '../../controllers/election_controller.dart';
import 'components/grid.dart';
import 'components/grid2.dart';
import 'components/grid3.dart';
import 'components/grid4.dart';
import 'components/list1.dart';
import 'components/list2.dart';
import 'components/list3.dart';
import 'components/list4.dart';
import 'item/grid_vote_item.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({Key? key}) : super(key: key);

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {

  int pageViewIndex = 0;
  bool isGridView = true;
  final ElectionController controller = Get.find<ElectionController>();

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 220,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Title of poll",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "Duration: 3hrs",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w300,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 195.w,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageViewIndex == 0
                                ? const Color(0xFFFFAC30)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFFFFAC30),
                            ),
                          ),
                          child: Image.asset(
                            'assets/icons/profile.png',
                            color: isDark ? Colors.white : const Color(0xFF200E32),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'President',
                            style: TextStyle(
                                color:
                                isDark ? Colors.white : const Color(0xFF200E32),
                                fontSize: 9,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: 30.w,
                        height: 2.h,
                        color: const Color(0xFFFFAC30),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageViewIndex == 1
                                ? const Color(0xFFFFAC30)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFFFFAC30),
                            ),
                          ),
                          child: Image.asset(
                            'assets/icons/profile.png',
                            color: isDark ? Colors.white : const Color(0xFF200E32),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'President',
                            style: TextStyle(
                                color:
                                isDark ? Colors.white : const Color(0xFF200E32),
                                fontSize: 9,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: 30.w,
                        height: 2.h,
                        color: const Color(0xFFFFAC30),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageViewIndex == 2
                                ? const Color(0xFFFFAC30)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFFFFAC30),
                            ),
                          ),
                          child: Image.asset(
                            'assets/icons/profile.png',
                            color: isDark ? Colors.white : const Color(0xFF200E32),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'President',
                            style: TextStyle(
                                color:
                                isDark ? Colors.white : const Color(0xFF200E32),
                                fontSize: 9,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: 30.w,
                        height: 2.h,
                        color: const Color(0xFFFFAC30),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageViewIndex == 3
                                ? const Color(0xFFFFAC30)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFFFFAC30),
                            ),
                          ),
                          child: Image.asset(
                            'assets/icons/profile.png',
                            color: isDark ? Colors.white : const Color(0xFF200E32),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'President',
                            style: TextStyle(
                                color:
                                isDark ? Colors.white : const Color(0xFF200E32),
                                fontSize: 9,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'President',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGridView = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Colors.transparent,
                            border: Border.all(
                              color: isDark ? Colors.grey : const Color(0xFF0D243C),
                            ),
                          ),
                          child: Icon(Icons.grid_4x4,
                              size: 20,
                              color: isDark ? Colors.grey : Colors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGridView = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Colors.transparent,
                            border: Border.all(
                              color: isDark ? Colors.grey : const Color(0xFF0D243C),
                            ),
                          ),
                          child: Icon(Icons.menu,
                              size: 20,
                              color: isDark ? Colors.grey : Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          onPageChanged: (index) {
            setState(() {
              pageViewIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                pageViewIndex == 0
                    ? isGridView
                    ? const Card1()
                    : const List1()
                    : pageViewIndex == 1
                    ? isGridView
                    ? const Card2()
                    : const List2()
                    : pageViewIndex == 2
                    ? isGridView
                    ? const Card3()
                    : const List3()
                    : pageViewIndex == 3
                    ? isGridView
                    ? const Card4()
                    : const List4()
                    : Container(),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 0, bottom: 70, right: 40),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            pageViewIndex == 0
                                ? const SizedBox()
                                : GestureDetector(
                              onTap: () {
                                if (pageViewIndex == 1) {
                                  setState(() {
                                    pageViewIndex = 0;
                                  });
                                } else if (pageViewIndex == 2) {
                                  setState(() {
                                    pageViewIndex = 1;
                                  });
                                } else if (pageViewIndex == 3) {
                                  setState(() {
                                    pageViewIndex = 2;
                                  });
                                }
                              },
                              child: Container(
                                height: 39,
                                width: 114.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: const Color(0xFFC4C4C4),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Previous",
                                    style: TextStyle(
                                        color: isDark
                                            ? Colors.white
                                            : const Color(0xFF6B6B6B)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (pageViewIndex == 0) {
                                  setState(() {
                                    pageViewIndex = 1;
                                  });
                                } else if (pageViewIndex == 1) {
                                  setState(() {
                                    pageViewIndex = 2;
                                  });
                                } else if (pageViewIndex == 2) {
                                  setState(() {
                                    pageViewIndex = 3;
                                  });
                                } else if (pageViewIndex == 3) {
                                  showModalBottomSheet(
                                      backgroundColor: isDark
                                          ? const Color(0xFF0D243C)
                                          : Colors.white,
                                      elevation: 20,
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0)),
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
                                                      color: Colors.black,
                                                      thickness: 2,
                                                      indent: 145.0,
                                                      endIndent: 145.0,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Center(
                                                      child: Text(
                                                        'Submitted Successfully',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: isDark
                                                                ? const Color(0xFFE7E7E7)
                                                                : const Color(
                                                                0xFF6B6B6B)),
                                                      )),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/picture.png",
                                                      ),
                                                    ],
                                                  ),
                                                  Center(
                                                      child: Text(
                                                        'Voting successfully submitted! 🎉',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: isDark
                                                                ? Colors.white
                                                                : const Color(
                                                                0xFF6B6B6B)),
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
                                                              builder:
                                                                  (context) =>
                                                                  const Results()));
                                                    },
                                                    child: Container(
                                                      width: 252,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(10),
                                                          color: const Color(
                                                              0xFF2706F4)),
                                                      child: const Center(
                                                        child: Text(
                                                          'Next',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.white,
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
                                      }); // vote success
                                }
                              },
                              child: Container(
                                height: 39,
                                width: 114.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color(0xFF2706F4),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ))
              ],
            );
          }),
      backgroundColor: isDark ? const Color(0xFF0D243C) : const Color(0xFFF1F3F6),
    );
  }
}


