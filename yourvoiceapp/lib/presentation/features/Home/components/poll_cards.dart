import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:thumbprint/presentation/features/Home/components/vote_link_sheet.dart';


class PollCards extends StatefulWidget {
  const PollCards({Key? key}) : super(key: key);

  @override
  _PollCardsState createState() => _PollCardsState();
}

class _PollCardsState extends State<PollCards> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SizedBox(
      height: 150.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: Ink(
              width: 56.w,
              height: 56.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFAC30),
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      enableDrag: true,
                      //isDismissible: false,
                      //isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.r)),
                      ),
                      context: context,
                      builder: (context) => const VoteLinkSheet());
                },
                // splashColor: Colors.white,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 17.h),
                  child: SvgPicture.asset(
                    "assets/icons/clip_icon.svg",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 14.w,
          ),
          SingleChildScrollView(
            child: Material(
              color: Colors.transparent,
              child: Ink(
                height: 120.h,
                width: 115.w,
                decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF212330) : const Color(0xFFF1F3F6),
                    borderRadius: BorderRadius.all(Radius.circular(12.r))),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 12.h,
                      ),
                      Column(
                        children: [
                          const Center(
                              child: CircularStepProgressIndicator(
                                  totalSteps: 100,
                                  currentStep: 72,
                                  selectedColor: Colors.blue,
                                  unselectedColor: Colors.white,
                                  padding: 0,
                                  height: 70,
                                  width: 70,
                                  child: Center(child: Text('87.6')))),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Time Left",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 12.sp,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 14.w,
          ),
          SingleChildScrollView(
            child: Material(
              color: Colors.transparent,
              child: Ink(
                height: 120.h,
                width: 115.w,
                decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF212330) : const Color(0xFFF1F3F6),
                    borderRadius: BorderRadius.all(Radius.circular(12.r))),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 72.w,
                        height: 71.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              child: SvgPicture.asset(
                                "assets/icons/arc_progress.svg",
                                width: 67.w,
                                height: 66.h,
                              ),
                            ),
                            Positioned(
                              top: 25.h,
                              //width: 4.h,
                              // height: 10.h,
                              child: SvgPicture.asset(
                                "assets/icons/love.svg",
                                width: 7.h,
                                height: 6.h,
                              ),
                            ),
                            Positioned(
                              top: 35.h,
                              child: Text(
                                "29.2k",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    fontSize: 11.sp,
                                    color: Colors.blueGrey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Poll progress",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 11.sp,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
