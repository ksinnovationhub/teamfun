import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'package:thumbprint/main.dart';

import '../../core/utils/consts.dart';
import '../api/auth_manager.dart';
import '../models/vote.dart';



class VotersVM extends GetConnect{

  final AuthenticationManager _authManager = Get.find();

  Future<Vote> getElectionDashboard() async {

    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'
    };

    var response = await get("http://64.227.102.13/api/v1/election/5/dashboard",
        headers: headers
    );

    if(response.status.hasError){
      print('failed election');
      return Future.error(response.statusText!);
    }else{
      print("election ${response.body}");
      return Vote.fromJson(response.body);

    }
  }
}
