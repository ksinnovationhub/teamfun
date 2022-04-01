import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thumbprint/main.dart';

import '../../core/utils/consts.dart';
import '../api/auth_manager.dart';
import '../models/election.dart';




class ElectionVM extends GetConnect {
  final AuthenticationManager _authManager = Get.find();

  Future<Election> getElectionData() async{



    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'
    };

    var response = await get("http://64.227.102.13/api/v1/user/5/available-election-positions",
        headers: headers
    );

    if(response.status.hasError){
      print('failed');
      return Future.error(response.statusText!);
    }else{
      print("contestants ${response.body}");
      return Election.fromJsonMap(response.body);

    }

  }

}
