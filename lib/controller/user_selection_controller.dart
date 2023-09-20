import 'package:get/get.dart';

class UserSelectionController extends GetxController {
  RxInt selectuserIndex = 0.obs;
  void selectUser(index) {
    selectuserIndex.value = index;
  }
}
