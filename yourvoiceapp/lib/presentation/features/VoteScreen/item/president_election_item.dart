import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thumbprint/data/models/candidates.dart';
import 'package:thumbprint/presentation/features/VoteScreen/item/president_item.dart';

import '../../../controllers/candidates_controller.dart';

class PresidentElectionItem extends StatefulWidget{


  PresidentElectionItem({Key? key,  }) : super(key: key);

  @override
  State<PresidentElectionItem> createState() => _PresidentElectionItemState();
}

class _PresidentElectionItemState extends State<PresidentElectionItem> {

  bool istapped = false;
  final CandidatesController controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding:
      const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
          width: 324.28.w,
          height: istapped ? 300 : 120.87.h,
          decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF091A2C)
                  : const Color(0xFFF1F3F6),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('President'),
                    IconButton(
                        onPressed: () {
                          if (istapped == true) {
                            setState(() {
                             istapped = false;
                            });
                          } else {
                            setState(() {
                              istapped = true;
                            });
                          }
                        },
                        icon: istapped
                            ? const Icon(Icons.arrow_upward)
                            : const Icon(Icons.arrow_downward))
                  ],
                ),
              ),
              istapped
                  ? controller.obx((data)
                   => Expanded(
                     child: Padding(
                       padding: const EdgeInsets.only(bottom: 10),
                       child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data!.data!.president!.length,
                        itemBuilder: (BuildContext context,
                            int index) {
                           return PresidentItem(president: data.data!.president![index]);
                        }),
                     ),
                   ),
                  )
                  : Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  height: 60.78.h,
                  width: 299.19.w,
                  decoration: isDark
                      ? BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0,
                        3,
                      ],
                      colors: [
                        Color(0xFF133252),
                        Color(0xFF0A1D31)
                      ],
                    ),
                    borderRadius:
                    BorderRadius.circular(10),
                  )
                      : BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: isDark
                            ? Colors.white
                            :const  Color(0xFFD0F0FE),
                        child: Image.asset(
                            'assets/images/Avatar-3.png'),
                      ),
                      title: Text(
                        'Oluwafemi Adesina',
                        style: GoogleFonts.workSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: isDark
                                ? Colors.white
                                :const  Color(0xFF200E32)),
                      ),
                      subtitle: Text(
                        'Winner!',
                        style: GoogleFonts.workSans(
                            fontSize: 15,
                            color: isDark
                                ?const  Color(0xFFF1F1F1)
                                :const  Color(0xFF6B6B6B)),
                      ),
                      trailing:const  Text('  95\nvotes'),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}