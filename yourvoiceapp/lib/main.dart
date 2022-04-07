import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:thumbprint/presentation/features/Home/home.dart';
import 'package:thumbprint/presentation/features/onboarding/splash.dart';
import 'core/services/dataConnectivityservice.dart';
import 'core/widgets/NetworkerrorIndicator.dart';
import 'di/app_bindings.dart';



void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late OverlaySupportEntry entry;
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    DataConnectivityService()
        .connectivityStreamController
        .stream
        .listen((event) {
      print(event);
      if (event == InternetConnectionStatus.disconnected) {
        entry = showOverlayNotification((context) {
          return const NetworkErrorAnimation();
        }, duration: const Duration(hours: 1));
      } else {
        entry.dismiss();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return OverlaySupport.global(
      child: ScreenUtilInit(
        builder:()=> GetMaterialApp(
            title: 'YourVoice',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            home:  Splash()
         )
        ),
    );
  }
}

