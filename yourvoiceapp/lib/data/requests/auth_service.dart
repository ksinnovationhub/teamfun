import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:thumbprint/data/api/auth_manager.dart';
import 'package:thumbprint/data/cache/cache_manager.dart';
import 'package:thumbprint/data/models/sign_up_response.dart';

import '../../core/utils/consts.dart';
import '../../core/widgets/loader.dart';
import '../../core/widgets/toast.dart';
import '../../presentation/features/Home/home.dart';
import '../../presentation/features/auth/otp/otp_screen.dart';
import '../api/endpoints.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/sign_up_request.dart';
import '../models/update_request.dart';
import '../models/update_response.dart';


class AuthService extends GetConnect {
  final AuthenticationManager _authManager = Get.find();

  Future<SignUpResponse?> fetchRegister(SignUpRequestModel signUpRequestModel
     ) async {
    final response = await post('http://64.227.102.13/api/v1/create-account', signUpRequestModel.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return SignUpResponse.fromJson(response.body);
    } else {
      return null;
    }
  }


  Future<LoginResponse?> fetchLogin(LoginRequestModel model) async {

    final response = await post('http://64.227.102.13/api/v1/login', model.toJson());


    if (response.statusCode == HttpStatus.ok) {
      return LoginResponse.fromJson(response.body);
    } else {
      return null;
    }
  }
  Future<UpdateResponse?> fetchUpdate(UpdateRequest model) async {

    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'
    };
    final response = await post('http://127.0.0.1:8000/api/v1/admin/update-profile', model.toJson(),
    headers: headers
    );
    if (response.statusCode == HttpStatus.ok) {
      return UpdateResponse.fromJson(response.body);
    } else {
      return null;
    }
  }

}


