import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thumbprint/presentation/features/Home/home.dart';

import '../../core/utils/show_loading.dart';
import '../../data/api/auth_manager.dart';
import '../../data/models/login_request.dart';
import '../../data/requests/auth_service.dart';

class LoginController extends GetxController{

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  late var loading = false.obs;
  late final AuthService _authService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _authService = Get.find();
    _authManager = Get.find();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }



  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  Future<void> loginUser(String email, String password) async {
    showLoading();
    final response = await _authService
        .fetchLogin(LoginRequestModel(email: email, password: password));
   // _authManager.login(response!.data!.token);
    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.data!.token);
      //_clearControllers();
      Get.offAll(()=> const Home());
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

  _clearControllers(){
    emailController.clear();
    passwordController.clear();
  }
}