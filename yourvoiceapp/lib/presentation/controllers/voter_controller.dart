import 'package:get/get.dart';


import '../../data/models/vote.dart';
import '../../data/requests/votersVM.dart';



class VoterController  extends GetxController with StateMixin<Vote>{
 final VotersVM vm = VotersVM();

  @override
  void onInit() {
    super.onInit();
   vm.getElectionDashboard().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }

}