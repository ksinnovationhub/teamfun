import 'package:flutter/cupertino.dart';
import 'package:dialog_loader/dialog_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

class Loader {
   late DialogLoader _dialogLoader;

  Future<void> show(BuildContext context, String s) async {
    _dialogLoader = DialogLoader(context: context);
    _dialogLoader.show(
      backgroundColor: Colors.transparent,
      theme: LoaderTheme.dialogDefault,
      title: CircularProgressIndicator(
        color: Color(0xFF2706F4),
        strokeWidth: 4,
      ),
    );
  }

  void hide(context) {
    _dialogLoader.close();
  }
}
