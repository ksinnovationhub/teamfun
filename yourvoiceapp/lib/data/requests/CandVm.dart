import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/consts.dart';
import '../../main.dart';
import '../api/auth_manager.dart';
import '../models/candidates.dart';



class CandVM  extends GetConnect{

  final AuthenticationManager _authManager = Get.find();

  Future<Candidates> getContestantsWithWinnerStatus() async {


    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'
    };

    var response = await get("http://64.227.102.13/api/v1/election/5/preview-contestants",
        headers: headers
    );

    if(response.status.hasError){
      print('failed');
      return Future.error(response.statusText!);
    }else{
      print("candidates ${response.body}");
      return Candidates.fromJson(response.body);

    }
  }
}
