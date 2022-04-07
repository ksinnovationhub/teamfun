import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/consts.dart';
import '../../../controllers/voter_controller.dart';




class PollProgressBars extends GetView<VoterController> {
  const PollProgressBars({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      width: 325.w,
      height: 203.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isDark ? const Color(0xFF133252) : const Color(0xFFF1F3F6)),
      child: SingleChildScrollView(
        child: controller.obx((data)
        =>  Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 10.h),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Current Polls updates",
                  style: TextStyle(
                    color: Colors.blueGrey.shade200,
                    fontSize: 12.sp,
                    fontFamily: 'SFpro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${data!.data!.electionCandidates!.first.name}",
                            style: TextStyle(
                              color: Colors.blueGrey.shade200,
                              fontSize: 12.sp,
                              fontFamily: 'SFpro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                              "assets/icons/progress_arrow.svg")
                        ],
                      ),
                      Text(
                        "78%",
                        style: TextStyle(
                          color: Colors.blueGrey.shade200,
                          fontSize: 12.sp,
                          fontFamily: 'SFpro',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const ClipRRect(
                    // The border radius (`borderRadius`) property, the border radius of the rounded corners.
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                    child: LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xffF8C200)),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${data.data!.electionCandidates!.first.name}",
                            style: TextStyle(
                              color: Colors.blueGrey.shade200,
                              fontSize: 12.sp,
                              fontFamily: 'SFpro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                              "assets/icons/progress_arrow.svg")
                        ],
                      ),
                      Text(
                        "78%",
                        style: TextStyle(
                          color: Colors.blueGrey.shade200,
                          fontSize: 12.sp,
                          fontFamily: 'SFpro',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const ClipRRect(
                    // The border radius (`borderRadius`) property, the border radius of the rounded corners.
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                    child: LinearProgressIndicator(
                      value: 0.1,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xff0066FF)),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${data.data!.electionCandidates!.first.name}",
                            style: TextStyle(
                              color: Colors.blueGrey.shade200,
                              fontSize: 12.sp,
                              fontFamily: 'SFpro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                              "assets/icons/progress_arrow.svg")
                        ],
                      ),
                      Text(
                        "78%",
                        style: TextStyle(
                          color: Colors.blueGrey.shade200,
                          fontSize: 12.sp,
                          fontFamily: 'SFpro',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const ClipRRect(
                    // The border radius (`borderRadius`) property, the border radius of the rounded corners.
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                    child: LinearProgressIndicator(
                      value: 0.4,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xffF55A72)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
           onLoading:  Shimmer.fromColors(
               baseColor: isDark ? const Color(0xFF133252) : const Color(0xFFF1F3F6),
               highlightColor: bluetext,
               child: Container(
                 height: 203.h,
                 color: isDark ? const Color(0xFF133252) : const Color(0xFFF1F3F6),
               )),
          onError: (err)=>Center(
            child: Text(
              err.toString(),
              style: GoogleFonts.roboto(
                color: isDark ? Colors.white : scaffoldColorDark,
                fontSize: 30,
              ),
            ),
          )
        )
      ),
    );
  }
}
