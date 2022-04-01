import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewRow extends StatelessWidget {
  // final IconData icon;
  final String text;
  final Function click;

  const NewRow(
      {Key? key,
      //required this.icon,
      required this.text,
      required this.click})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
