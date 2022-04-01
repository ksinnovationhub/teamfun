import 'package:get/get.dart';

import '../../data/models/notifications.dart';
import '../../data/requests/NotificationVm.dart';


class NotificationController extends GetxController with StateMixin<Notifications>{

  final NotificationVm notificationVm = NotificationVm();

  @override
  void onInit() {
    super.onInit();
    notificationVm.getallnotification().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }
}