
import 'package:get/get.dart';
import 'package:thumbprint/data/requests/auth_service.dart';
import 'package:thumbprint/presentation/controllers/login_controller.dart';
import 'package:thumbprint/presentation/controllers/sign_up_controller.dart';

import '../data/api/auth_manager.dart';
import '../presentation/controllers/candidates_controller.dart';
import '../presentation/controllers/election_controller.dart';
import '../presentation/controllers/notification_controller.dart';
import '../presentation/controllers/user_controller.dart';
import '../presentation/controllers/vote_controller.dart';
import '../presentation/controllers/voter_controller.dart';


class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthenticationManager(),permanent: true);
    Get.put(SignUpController(),permanent: true);
    Get.put(AuthService(),permanent: true);
    Get.put(LoginController(),permanent: true);
   Get.put(ElectionController(), permanent: true);
   //Get.put(UserController(),permanent: true);
   //Get.put(VoterController(),permanent: true);
   Get.put(CandidatesController(),permanent: true);
   Get.put(NotificationController(), permanent: true);
   Get.put(VoteController(), permanent: true);
  }

}