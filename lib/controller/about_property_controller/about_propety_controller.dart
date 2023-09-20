import 'package:get/get.dart';

class AboutPropertyController extends GetxController {
  var isExpanded = RxBool(false);
  void onExpand(val) {
    isExpanded.value = val;
  }
}
