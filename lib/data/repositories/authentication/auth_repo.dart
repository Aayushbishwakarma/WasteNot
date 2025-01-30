import 'package:authentication/features/authentication/view/login/login_view.dart';
import 'package:authentication/features/authentication/view/onboarding/onboarding_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart ';
import 'package:get_storage/get_storage.dart';


class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();

  ///Call from main.dart on app launch
  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///Function to Show Relevant Screen
  screenRedirect() async{
    //Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.off(() => const LoginView()) : Get.off(()=> const OnBoardingView());
  }
}
