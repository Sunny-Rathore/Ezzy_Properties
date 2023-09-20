import 'package:get/get.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/pages/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/agent_seller/bottom_nav_bar/bottom_nav.dart';
import '../pages/agent_seller/home/home.dart';

class SplashController extends GetxController {
  final AuthController authController = Get.find();
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id') ?? '';
    await authController.checkLoginStatus();

    Future.delayed(const Duration(seconds: 2), () {
      if (authController.isLoggedIn.value == false &&
          authController.checkUser.value == 10) {
        Get.offAll(() => const IntroScreen());
      }
      if (authController.isLoggedIn.value == true ||
          id == 2 && authController.checkUser.value == 2) {
        Get.offAll(() => HomeView(
              userSelectionindex: authController.checkUser.value,
            ));
      }
      if (authController.isLoggedIn.value == true &&
              authController.checkUser.value == 0 ||
          authController.checkUser.value == 1) {
        Get.offAll(() =>
            BottomNavView(userselectionindex: authController.checkUser.value));
      }
    });
  }
}
