import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thumbprint/presentation/features/VoteScreen/item/president_election_item.dart';
import 'package:thumbprint/presentation/features/VoteScreen/item/president_item.dart';
import 'package:thumbprint/presentation/features/VoteScreen/item/vice_president_election_item.dart';

import '../../controllers/candidates_controller.dart';


class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  final CandidatesController controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Center(
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
                      width: 185.w,
                    ),
                    SvgPicture.asset("assets/icons/union.svg"),
                  ],
                ),
              ),
            ),
          )),
      body: Column(
        children: [
          PresidentElectionItem(),
          VicePresidentElectionItem(),
        ],
      ),
      backgroundColor: isDark ?const  Color(0xFF0D243C) :const  Color(0xFFF1F3F6),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 75, right: 20),
        child: FloatingActionButton(
          backgroundColor:const  Color(0xFFFFAC30),
          onPressed: () {},
          child: Center(child: Image.asset('assets/icons/Vector.png')),
        ),
      ),
    );
  }
}
