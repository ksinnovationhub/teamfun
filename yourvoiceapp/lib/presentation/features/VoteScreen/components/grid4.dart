import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../controllers/election_controller.dart';
import '../item/grid_vote_item.dart';

class Card4 extends GetView<ElectionController> {
  const Card4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Center(
      child: controller.obx((data)
      => SizedBox(
        height: 700.h,
        child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 120),
            child: GridView.builder(
                itemCount: data!.data.contestants.where((element) => element.position == 'Vice President').length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 45,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return GridVoteItem(contestants:data.data.contestants.where((element)
                  => element.position== 'Vice President').toList()[index],
                    index: index,
                    );
                })

        ),
      ),
          onError: (error) =>Text('An error occured '+error.toString())
      ),
    );
  }
}
