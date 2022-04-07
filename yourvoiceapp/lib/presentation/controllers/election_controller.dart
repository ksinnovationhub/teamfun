
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/election.dart';
import '../../data/requests/ElectionVm.dart';


class ElectionController extends GetxController with  StateMixin<Election>{

  final ElectionVM electionVM = ElectionVM();
  var currentStep =0.obs;


  @override
  void onInit() {
    super.onInit();
    electionVM.getElectionData().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }


}

