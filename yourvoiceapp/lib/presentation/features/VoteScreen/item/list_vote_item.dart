import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/models/election.dart';
import '../../../controllers/vote_controller.dart';

class ListVoteItem extends StatefulWidget {

  final Contestants contestants;
  final int index;
  final bool isDark;

  const ListVoteItem({Key? key, required this.contestants,
    required this.isDark, required this.index}) : super(key: key);

  @override
  _ListVoteItemState createState() => _ListVoteItemState();
}

class _ListVoteItemState extends State<ListVoteItem> {

  bool tapped = false;
  final VoteController voteController = Get.find<VoteController>();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Container(
        height: 100.h,
        decoration: widget.isDark
            ? BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.15,
              0.5,
            ],
            colors: [Color(0xFF133252), Color(0xFF0A1D31)],
          ),
          borderRadius: BorderRadius.circular(10),
        )
            : BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Center(
          child: ListTile(
            leading: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: widget.isDark
                      ? Colors.white
                      : const Color(0xFFD0F0FE),
                  shape: BoxShape.circle
              ),
              child:  Center(child: Text(widget.contestants.name[0],
                style: TextStyle(
                    fontSize: 20.sp,
                    color: widget.isDark
                        ? const Color(0xFF133252)
                        : Colors.white
                ),
              )),
            ),
            title: Text(
              widget.contestants.name,
              style: GoogleFonts.workSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: widget.isDark ? Colors.white : const Color(0xFF200E32)),
            ),
            subtitle: Text(
              widget.contestants.position,
              style: GoogleFonts.workSans(
                  fontSize: 15,
                  color:
                  widget.isDark ? const Color(0xFFF1F1F1) : const Color(0xFF6B6B6B)),
            ),
            trailing: GestureDetector(
              onTap: (){
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
                height: 30.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                  border: Border.all(
                    color: const Color(0xFFFFAC30),
                  ),
                ),
                child: Center(
                    child: tapped == false ? Text(
                      'Vote',
                      style: GoogleFonts.workSans(
                          color: const Color(0xFFFFAC30), fontSize: 15),
                    ):Text(
                      'Retract',
                      style: GoogleFonts.workSans(
                          color: const Color(0xFFFFAC30), fontSize: 15),
                    ) ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
