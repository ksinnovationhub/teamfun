import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thumbprint/data/models/update_request.dart';

import '../../core/utils/show_loading.dart';
import '../../data/api/auth_manager.dart';
import '../../data/requests/auth_service.dart';
import '../features/Home/home.dart';

class UpdateProfileController extends GetxController{
  late var loading = false.obs;
  late final AuthService _authService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.find();
    _authManager = Get.find();

  }

  Future<void> updateProfile(String name, String email) async {
    showLoading();
    final response = await _authService
        .fetchUpdate(UpdateRequest(name: name, email: email));

    if (response != null) {
      /// Set isLogin to true
      Get.offAll(const Home());
    } else {
      dismissLoadingWidget();

      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}