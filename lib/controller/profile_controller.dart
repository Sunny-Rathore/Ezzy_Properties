import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RxBool isEdit = true.obs;
  void editProfile(val) {
    isEdit.value = val;
  }
}
