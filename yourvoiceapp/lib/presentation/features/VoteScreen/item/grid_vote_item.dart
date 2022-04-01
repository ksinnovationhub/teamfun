import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thumbprint/presentation/controllers/candidates_controller.dart';
import 'package:thumbprint/presentation/controllers/vote_controller.dart';

import '../../../../data/models/election.dart';


class GridVoteItem extends StatefulWidget {

 final Contestants contestants;
 final int index;
  const GridVoteItem({Key? key, required this.contestants, required this.index}) : super(key: key);

  @override
  State<GridVoteItem> createState() => _GridVoteItemState();
}

class _GridVoteItemState extends State<GridVoteItem> {
  bool tapped = false;
  final VoteController voteController = Get.find<VoteController>();


  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
     // height: 250,
      width: 150,
      decoration: isDark
          ? BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.15,
            0.5,
          ],
          colors: [
            Color(0xFF133252),
            Color(0xFF0A1D31)
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      )
          : BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white
                    : const Color(0xFFD0F0FE),
                shape: BoxShape.circle
              ),
             child:  Center(child: Text(widget.contestants.name[0],
             style: TextStyle(
               fontSize: 20.sp,
               color: isDark
                   ? const Color(0xFF133252)
                   : Colors.white
             ),
             )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text( widget.contestants.name,
              style: GoogleFonts.workSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? Colors.white
                      : const Color(0xFF200E32)),
            ),
          ),
          Text(
            widget.contestants.position,
            style: GoogleFonts.workSans(
                fontSize: 15.sp, color: Colors.blueGrey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GestureDetector(
                onTap: () {
                  if (tapped == true) {
                    setState(() {
                      voteController.retractVote(widget.contestants.election_id.toString(),
                          widget.contestants.id.toString());
                     tapped = false;
                    });
                  } else {
                    setState(() {
                      voteController.castVote(widget.contestants.election_id.toString(),
                         widget.contestants.id.toString());
                      tapped = true;
                    });

                 }
                },
                child: Container(
                  height: 40.h,
                  width: 120.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFFFFAC30),
                    ),
                  ),
                  child:  Center(
                      child: tapped == false ? const Text('Vote'):const Text('Retract')
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
