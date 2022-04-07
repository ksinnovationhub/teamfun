import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/consts.dart';
import '../../../controllers/voter_controller.dart';



class CardContent extends StatelessWidget {
  CardContent({Key? key}) : super(key: key);

  final VoterController controller = Get.put(VoterController());

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
        height: 120.h,
        width: 325.w,
        decoration: BoxDecoration(
            color: isDark ? const Color(0xFF133252) : const Color(0xFFF1F3F6),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Current Polls updates",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SFpro',
                                color: isDark
                                    ? Colors.blueGrey.shade100
                                    : const Color(0xFF133252),
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          SizedBox(
                            width: 110.w,
                            height: 59.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.obx((data)
                                => Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                          Text(data!.data!.votesCasted == 0 ? "---":
                        "${data.data!.votesCasted}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: isDark
                                ? Colors
                                .blueGrey.shade100
                                : const Color(0xFF133252),
                            fontSize: 30.sp),
                      )
                                  ],
                                ),
                                  onLoading: JumpingDotsProgressIndicator(
                                    numberOfDots: 5,
                                    fontSize: 20.0,
                                    color: isDark
                                        ? bluetext
                                        : Colors.black,
                                  ),
                                  onError: (err)=> Text(
                                    "Failed to Load",
                                    style: GoogleFonts.roboto(
                                      color: isDark
                                          ? Colors.white
                                          : scaffoldColorDark,
                                      fontSize: 20,
                                    ),
                                ),
                                ),
                                Text(
                                  "Total poll",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SFpro',
                                      color: Colors.grey,
                                      fontSize: 8.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            "last updated yesterday",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SFpro',
                                color: Colors.grey,
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 43.h,
                          ),
                          SvgPicture.asset(
                            "assets/images/chart.svg",
                            width: 83.w,
                            height: 32.h,
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Polls",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'SFpro',
                                    color: Colors.blueGrey.shade100,
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "53%",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'SFpro',
                                    color: const Color(0xFF00C48C),
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/chevron_up.svg",
                                width: 11.w,
                                height: 6.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
