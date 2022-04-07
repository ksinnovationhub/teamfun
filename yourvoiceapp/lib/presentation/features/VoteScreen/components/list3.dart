import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../controllers/election_controller.dart';
import '../item/list_vote_item.dart';

class List3 extends GetView<ElectionController> {
  const List3({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Center(
      child:  controller.obx((data) => Container(
        color: Colors.transparent,
        height: 700.h,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: ListView.builder(
            itemCount:  data!.data.contestants.where((element) => element.position == 'President').length,
            itemBuilder: (BuildContext context, int index) {
              return ListVoteItem(contestants:data.data.contestants.where((element)
              => element.position== 'President').toList()[index] ,isDark: isDark,
                index: index,
              );
            },
          ),
        ),
      ),
      ),
    );
  }
}
