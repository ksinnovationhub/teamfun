import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../core/utils/consts.dart';
import '../../Settings/Setting.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Image.asset(
            'assets/icons/back.png',
            color: isDark ? generaltextColor : lightthemetextColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ContactUs',
              style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? specialtext : headingColorLight),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Settings()));
                },
                child: SvgPicture.asset("assets/icons/union.svg")),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Text('Name*')],
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF9F9C9C),
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.lightBlue),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your full name',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18)),
                      textInputAction: TextInputAction.next,
                      cursorColor: buttonColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Text('Email*')],
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF9F9C9C),
                      ),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.lightBlue),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email address',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18)),
                        textInputAction: TextInputAction.next,
                        cursorColor: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Text('Subject*')],
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF9F9C9C),
                      ),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.lightBlue),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your subject today...',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18)),
                        textInputAction: TextInputAction.next,
                        cursorColor: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Text('Despriction*')],
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF9F9C9C),
                      ),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.lightBlue),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18)),
                        textInputAction: TextInputAction.next,
                        cursorColor: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
