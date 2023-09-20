import 'package:get/get.dart';

class PropertyTypeController extends GetxController {
  RxInt selectuserIndex = 0.obs;
  void selectUser(val) {
    selectuserIndex.value = val;
  }
}
