import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';


//our network connectivity service
class DataConnectivityService {
  StreamController<InternetConnectionStatus> connectivityStreamController =
      StreamController<InternetConnectionStatus>();
  DataConnectivityService() {
    InternetConnectionChecker().onStatusChange.listen((dataConnectionStatus) {
      connectivityStreamController.add(dataConnectionStatus);
    });
  }
}
