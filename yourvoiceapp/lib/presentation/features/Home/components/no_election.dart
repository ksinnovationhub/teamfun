import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoElection extends StatefulWidget {
  const NoElection({Key? key}) : super(key: key);

  @override
  _NoElectionState createState() => _NoElectionState();
}

class _NoElectionState extends State<NoElection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("assets/icons/no_election.svg"),
          SizedBox(
            height: 62.h,
          ),
          Text(
            "Start building your dashboard!",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF474747)),
          ),
          SizedBox(
            height: 62.h,
          ),
          SizedBox(
            width: 293.w,
            height: 60.h,
            child: Text(
              "Before we can create your charts, "
              "we’ll first need to get some data in here! "
              "paste the election link to start!",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7B7B7B)),
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          SizedBox(
            width: 245.w,
            height: 42.h,
            child: ElevatedButton(
              onPressed: () {
                /*if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                          context, SlideLeftAnimation(exitPage: RegisterScreen(),
                          enterPage: OtpScreen()));
                    }*/
              },
              child: Text(
                'Paste election link',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFAC30),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
