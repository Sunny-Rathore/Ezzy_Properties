import 'package:get/get.dart';

class LocalizationController extends GetxController {
  var locale = ''.obs;

  void changeLocale(String newLocale) {
    locale.value = newLocale;
  }

  static LocalizationController get to => Get.find();
}
