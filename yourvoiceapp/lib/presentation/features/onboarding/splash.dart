
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thumbprint/data/requests/auth_service.dart';

import '../../../data/api/auth_manager.dart';
import 'onboard.dart';


class Splash extends StatelessWidget {

  final AuthenticationManager _authManager = Get.find<AuthenticationManager>();

   Splash({Key? key}) : super(key: key);

Future<void> initializeSettings() async {
  _authManager.checkLoginStatus();
  //Simulate other services for 3 seconds
  await Future.delayed(const Duration(seconds: 3));
}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoard();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        backgroundColor: const Color(0xFF6ED47C),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Image.asset('assets/images/avatar.png',height: 100, width: 200,)
            ],
          ),
        ));
  }
}
