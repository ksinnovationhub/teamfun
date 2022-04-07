import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:thumbprint/main.dart';

import '../../core/utils/consts.dart';
import '../api/auth_manager.dart';
import '../models/user.dart';


class UserVM extends GetConnect{
  final AuthenticationManager _authManager = Get.find();

  Future<User> getUserDetails() async {

    print( _authManager.getToken());
    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'
    };


    var response = await get("http://64.227.102.13/api/v1/user/me",
        headers: headers
    );

    if(response.status.hasError){
      print('failed');
      return Future.error(response.statusText!);
    }else{
      print("user ${response.body}");
      return User.fromJson(response.body);

    }
  }
}
