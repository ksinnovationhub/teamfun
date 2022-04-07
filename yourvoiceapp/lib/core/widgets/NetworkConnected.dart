
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../services/dataConnectivityservice.dart';
import '../utils/consts.dart';


class Connected extends StatefulWidget {
  const Connected({Key? key}) : super(key: key);

  @override
  _ConnectedState createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
  late bool connected;

  checkConnectionState() {
    DataConnectivityService()
        .connectivityStreamController
        .stream
        .listen((event) {
      if (kDebugMode) {
        print(event);
      }
      if (event == InternetConnectionStatus.disconnected) {
        setState(() {
          connected = false;
        });
      } else {
        setState(() {
          connected = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      color: Colors.blueGrey,
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
                Center(
                    child: Text(
                  ' Internet Connection',
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
                      'Your internet connection has been restored,you can resume now',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          color: isDark ? Colors.white : const Color(0xFF6B6B6B),
                          fontWeight: FontWeight.w300,
                          fontSize: 15)),
                )),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade800),
                    child: const Center(
                      child: Text(
                        'continue',
                        style: TextStyle(color: Colors.white60, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onClosing: () {},
        ),
      ),
    );
  }
}
