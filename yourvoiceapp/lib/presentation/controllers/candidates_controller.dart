import 'package:get/get.dart';

import '../../data/models/candidates.dart';
import '../../data/requests/CandVm.dart';


class CandidatesController extends GetxController with StateMixin<Candidates>{


  final CandVM candVM = CandVM();

  @override
  void onInit() {
    super.onInit();
   candVM.getContestantsWithWinnerStatus().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }

}