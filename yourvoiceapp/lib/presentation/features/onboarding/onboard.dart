import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thumbprint/presentation/features/onboarding/get_started_screen.dart';
import 'package:thumbprint/presentation/features/onboarding/onboarding_screen.dart';

import '../../../data/api/auth_manager.dart';
import '../Home/home.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? const Home() : const OnBoardingScreen();
    });
  }
}