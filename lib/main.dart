import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:lottie/lottie.dart';
import 'bindings/home_binding.dart';
import 'configs/constants.dart';
import 'routes/home_route.dart';
import 'services/theme_helper.dart';
import 'utils/logger_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await MobileAds.instance.initialize().then((InitializationStatus status) {
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
          tagForChildDirectedTreatment:
              TagForChildDirectedTreatment.unspecified,
          testDeviceIds: Constants.testDeviceIds),
    );
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GetMaterialApp(
      title: Constants.AppName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeHelper().theme,
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      initialBinding: HomeBinding(),
      initialRoute: HomeRoute.splashPath,
      getPages: HomeRoute.pages,
      enableLog: true,
      logWriterCallback: Logger.write,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black54,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/rabit.json',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              onLoaded: (composition) {
                Timer(Duration(seconds: composition.duration.inSeconds), () {
                  Get.changeThemeMode(ThemeHelper().loadThemeFromBox()
                      ? ThemeMode.dark
                      : ThemeMode.light);
                  Get.offAllNamed(HomeRoute.homePath);
                  //Get.offAllNamed(HomeRoute.testPath);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
