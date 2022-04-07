import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'package:thumbprint/main.dart';

import '../../core/utils/consts.dart';
import '../api/auth_manager.dart';
import '../models/notifications.dart';


class NotificationVm extends GetConnect{

  final AuthenticationManager _authManager = Get.find();

  Stream<Notifications> getnotification() =>
      Stream.periodic(const Duration(seconds: 1))
          .asyncMap((event) => getallnotification());

  Future<Notifications> getallnotification() async {


    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'
    };

    var response = await get("http://64.227.102.13/api/v1/admin/list-notifications",
        headers: headers
    );

    if(response.status.hasError){
      print('failed');
      return Future.error(response.statusText!);
    }else{
      print("notif ${response.body}");
      return Notifications.fromJsonMap(response.body);

    }
  }
}
