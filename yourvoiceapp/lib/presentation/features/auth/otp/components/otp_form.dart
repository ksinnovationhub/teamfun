import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  final TextEditingController otpctrl1, otpctrl2, otpctrl3, otpctrl4;

  const OtpForm({Key? key, required this.otpctrl1, required this.otpctrl2, required this.otpctrl3, required this.otpctrl4}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey.shade200,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  width: 50,
                  height: 70,
                  child: TextFormField(
                    maxLength: 1,
                    controller: widget.otpctrl1,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    style: const TextStyle(
                        fontSize: 35,
                        color: Color(0xFF1152FD),
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey.shade200,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  width: 50,
                  height: 70,
                  child: TextFormField(
                    maxLength: 1,
                    controller: widget.otpctrl2,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                    focusNode: pin2FocusNode,
                    style: const TextStyle(
                        fontSize: 35,
                        color: Color(0xFF1152FD),
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) => nextField(value, pin3FocusNode),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey.shade200,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  width: 50,
                  height: 70,
                  child: TextFormField(
                    maxLength: 1,
                    controller: widget.otpctrl3,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    focusNode: pin3FocusNode,
                    style: const TextStyle(
                        fontSize: 35,
                        color: Color(0xFF1152FD),
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) => nextField(value, pin4FocusNode),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey.shade200,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  width: 50,
                  height: 70,
                  child: TextFormField(
                    maxLength: 1,
                    controller: widget.otpctrl4,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    focusNode: pin4FocusNode,
                    style: const TextStyle(
                        fontSize: 35,
                        color: Color(0xFF1152FD),
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FocusNode.unfocus();
                        // Then you need to check is the code is correct or not

                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
