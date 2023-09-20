import 'package:get/get.dart';

class PostPropetyController extends GetxController {
  RxInt postPropertiy = 0.obs;
  void chane(val) {
    postPropertiy.value = val;
  }
}
