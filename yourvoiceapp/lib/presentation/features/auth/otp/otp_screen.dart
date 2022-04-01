import 'package:flutter/material.dart';


import 'components/body.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpBody(),
      backgroundColor: const Color(0xFF0D243C),
    );
  }
}
