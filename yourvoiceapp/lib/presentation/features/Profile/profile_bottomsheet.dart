import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/consts.dart';


class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({Key? key}) : super(key: key);

  @override
  _ProfileBottomSheetState createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          builder: (context) => Container(
            height: 400,
            decoration: BoxDecoration(
              color: isDark ? scaffoldColorDark : scaffoldColorlight,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Divider(
                    color: Colors.blueGrey,
                    thickness: 2,
                    indent: 160,
                    endIndent: 160,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset('assets/icons/connected.png'),
                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'No Internet Connection',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF6B6B6B)),
                )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: SizedBox(
                  width: 200,
                  child: Text(
                      'You are not connected to the internet. Make sure your mobile data is on, Airplane Mode is off and try again.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          color: isDark ? Colors.white : const Color(0xFF6B6B6B),
                          fontWeight: FontWeight.w300,
                          fontSize: 15)),
                )),
              ],
            ),
          ),
          onClosing: () {},
        ),
      ),
    );
  }
}
