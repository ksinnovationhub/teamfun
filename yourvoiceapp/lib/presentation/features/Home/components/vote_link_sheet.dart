import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/consts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoteLinkSheet extends StatefulWidget {
  const VoteLinkSheet({Key? key}) : super(key: key);

  @override
  _VoteLinkSheetState createState() => _VoteLinkSheetState();
}

class _VoteLinkSheetState extends State<VoteLinkSheet> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SingleChildScrollView(
      child: Container(
        color: isDark ? const Color(0xFF0D243C) : Colors.white,
        height: 375.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.h),
              Center(
                child: Divider(
                  color: isDark ? Colors.grey : black,
                  thickness: 2,
                  indent: 145.0,
                  endIndent: 145.0,
                ),
              ),
              SizedBox(height: 38.h),
              Center(
                child: Text(
                  "Enter link to poll",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: isDark ? generaltextColor : textfieldcolor,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 44.h,
              ),
              buildVoteLinkForm(),
              SizedBox(height: 58.h),
              Center(
                child: SizedBox(
                  width: 252.w,
                  height: 45.h,
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
                      'Load',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVoteLinkForm() {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return TextFormField(
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                color: isDark ? const Color(0xFFF8F8F8) : bluetext,
                style: BorderStyle.solid)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                width: 7.0.w,
                color: isDark ? const Color(0xFFF8F8F8) : bluetext,
                style: BorderStyle.solid)),
        hintText: 'Enter poll link',
        hintStyle: TextStyle(
            fontSize: 16.sp,
            color: isDark ? bluetext : Colors.grey,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto'),
      ),
    );
  }
}
