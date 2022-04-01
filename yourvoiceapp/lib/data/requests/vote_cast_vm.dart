import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/consts.dart';
import '../../core/widgets/toast.dart';
import '../../main.dart';
import '../api/auth_manager.dart';
class VoteCastVm {

  final AuthenticationManager _authManager = Get.find();

  Future<void> castVote(String electionID, String electionContestantID) async{


    final url = Uri.parse('http://64.227.102.13/api/v1/user/vote');
    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'};

    Map data = {'election_id': electionID, 'election_contestant_id': electionContestantID};
    final response = await post(url, headers: headers, body: data);
     if(response.statusCode == 200 || response.statusCode == 201){
      var jsonRes = json.decode(response.body);
      var message =  jsonRes['message'];
       showToast(message.toString(), Colors.green);
     }else{
       showToast('Error occurred', Colors.red);
     }

  }
  Future<void> retractVote(String electionID, String electionContestantID) async{


    final url = Uri.parse('http://64.227.102.13/api/v1/user/retract-vote');
    final headers = {'Authorization': 'Bearer ${_authManager.getToken()}',
      'Accept': 'application/json'};

    Map data = {'election_id': electionID, 'election_contestant_id': electionContestantID};
    final response = await post(url, headers: headers, body: data);
    if(response.statusCode == 200 || response.statusCode == 201){
      var jsonRes = json.decode(response.body);
      var message =  jsonRes['message'];
      showToast(message.toString(), Colors.green);
    }else{
      showToast('Error occurred', Colors.red);
    }

  }
}