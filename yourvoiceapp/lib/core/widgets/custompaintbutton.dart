import 'dart:async';
import 'package:flutter/material.dart';

import '../utils/consts.dart';


class CustomPaintButton extends StatefulWidget {
  const CustomPaintButton({Key? key}) : super(key: key);

  @override
  _CustomPaintButtonState createState() => _CustomPaintButtonState();
}

class _CustomPaintButtonState extends State<CustomPaintButton>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> animation1;

  late AnimationController controller2;
  late Animation<double> animation2;

  late AnimationController controller3;
  late Animation<double> animation3;

  late AnimationController controller4;
  late Animation<double> animation4;

  late AnimationController controller5;
  late Animation<double> animation5;

  late AnimationController controller6;
  late Animation<double> animation6;

  late AnimationController controller7;
  late Animation<double> animation7;

  late AnimationController controller8;
  late Animation<double> animation8;

  bool boolValue1 = true;
  bool boolValue2 = true;
  bool boolValue3 = true;
  bool boolValue4 = true;
  double opacity1 = 1;
  double opacity2 = 0;

  @override
  void initState() {
    super.initState();

    // FIRST STEP
    controller1 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation1 = Tween<double>(begin: 0, end: .48)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    controller2 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation2 = Tween<double>(begin: 1, end: .52)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    controller3 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation3 = Tween<double>(begin: 0, end: .9)
        .animate(CurvedAnimation(parent: controller3, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          boolValue2 = false;
          boolValue3 = false;
          controller4.forward();
          controller5.forward();
        }
      });

    /// SECOND STEP
    controller4 =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation4 = Tween<double>(begin: 1.6, end: 26.74)
        .animate(CurvedAnimation(parent: controller4, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller7.forward();
          controller8.forward();
          boolValue3 = true;
          boolValue4 = false;
        }
      });

    controller5 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    animation5 = Tween<double>(begin: .01, end: 5)
        .animate(CurvedAnimation(parent: controller5, curve: Curves.easeInOut))
      ..addListener(
        () {
          setState(
            () {
              Timer(
                const Duration(milliseconds: 1300),
                () {
                  boolValue1 = false;
                  controller6.forward();
                },
              );
            },
          );
        },
      );

    controller6 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600));
    animation6 = Tween<double>(begin: 5, end: .01)
        .animate(CurvedAnimation(parent: controller6, curve: Curves.easeInOut))
      ..addListener(
        () {
          setState(() {});
        },
      );

    /// AND FINAL ONE
    controller7 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation7 = Tween<double>(begin: 1, end: .5)
        .animate(CurvedAnimation(parent: controller7, curve: Curves.elasticOut))
      ..addListener(
        () {
          setState(() {});
        },
      );

    controller8 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation8 = Tween<double>(begin: .0, end: .5)
        .animate(CurvedAnimation(parent: controller8, curve: Curves.elasticOut))
      ..addListener(
        () {
          setState(
            () {
              opacity2 = 1;
            },
          );
        },
      );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    controller8.dispose();
    super.dispose();
  }

  bool sent = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 70,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          if (sent == false) {
            setState(() {
              sent = true;
            });
          } else if (sent == true) {
            setState(
              () {
                controller1.forward();
                controller2.forward();
                controller3.forward();
                opacity1 = 0;
              },
            );
          }
        },
        child: Stack(
          children: [
            Center(
              child: CustomPaint(
                painter: MyPainter(
                    animation1.value,
                    animation2.value,
                    animation3.value,
                    animation4.value,
                    boolValue1 ? animation5.value : animation6.value,
                    boolValue2 ? Colors.green : green,
                    boolValue3 ? green : green,
                    animation7.value,
                    animation8.value,
                    Colors.green),
                child: Container(),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: opacity1,
                duration: const Duration(milliseconds: 300),
                child: const Text(
                  "Upload",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: opacity2,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double leftValue;
  final double rightValue;
  final double topValue;
  final double startAngleValue;
  final double sweepAngleValue;
  final Color buttonColor;
  final Color loadingColor;
  final Color completionColor;
  final double completionHeight;
  final double completionRadius;

  MyPainter(
      this.leftValue,
      this.rightValue,
      this.topValue,
      this.startAngleValue,
      this.sweepAngleValue,
      this.buttonColor,
      this.loadingColor,
      this.completionHeight,
      this.completionRadius,
      this.completionColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = buttonColor
      ..style = PaintingStyle.fill;

    Paint paintForLoading = Paint()
      ..color = loadingColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    Paint paintForThird = Paint()
      ..color = completionColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromLTRBR(size.width * leftValue, size.height * topValue,
            size.width * rightValue, size.height, const Radius.circular(99)),
        paint);

    canvas.drawArc(
        Rect.fromLTRB(size.width * .33, size.height * .1, size.width * .68,
            size.height * .94),
        startAngleValue,
        sweepAngleValue,
        false,
        paintForLoading);

    canvas.drawCircle(Offset(size.width * 0.5, size.height * completionHeight),
        size.height * completionRadius, paintForThird);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
