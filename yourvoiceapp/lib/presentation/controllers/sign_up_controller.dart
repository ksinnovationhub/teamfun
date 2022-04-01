import 'package:get/get.dart';
import 'package:thumbprint/presentation/features/Home/home.dart';

import '../../core/utils/show_loading.dart';
import '../../data/api/auth_manager.dart';
import '../../data/models/sign_up_request.dart';
import 'package:flutter/material.dart';

import '../../data/requests/auth_service.dart';

class SignUpController extends GetxController{


  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  AuthService _authService = Get.put(AuthService());
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

  Future<void> registerUser(String email, String password, String phone, String name) async {

    showLoading();
    final response = await _authService
        .fetchRegister(SignUpRequestModel(email: email, password: password, name: name, phone: phone));

    if (response != null) {
      /// Set isLogin to true

    //  _authManager.login(response.data);
      _clearControllers();
      Get.offAll(const Home());
    } else {
      /// Show user a dialog about the error response
      dismissLoadingWidget();
      Get.defaultDialog(
          middleText: 'Register Error',
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
