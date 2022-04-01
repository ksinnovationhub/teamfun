import 'package:get/get.dart';

import '../../data/models/user.dart';
import '../../data/requests/User_VM.dart';


class UserController extends GetxController with StateMixin<User>{

final UserVM userVM = UserVM();


  @override
  void onInit() {
    super.onInit();
   userVM.getUserDetails().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }

}