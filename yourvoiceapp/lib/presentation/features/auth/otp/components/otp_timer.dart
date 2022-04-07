import 'dart:async';
import 'package:flutter/material.dart';


class OtpTimer extends StatefulWidget {
  const OtpTimer({Key? key}) : super(key: key);

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 20;
  bool timerDone = false;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout(int milliseconds) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  checkTimer() {
    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        timerDone = true;
      });
    });
  }

  @override
  void initState() {
    checkTimer();
    startTimeout(200);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return timerDone != false
        ? GestureDetector(
            onTap: () {
              startTimeout(200);
            },
            child: Text(
              "Resend code($timerText)",
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          )
        : Text(
            "Resend code($timerText)",
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.grey,
            ),
          );
  }
}
