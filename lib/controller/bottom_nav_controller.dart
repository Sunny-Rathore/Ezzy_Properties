import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt index = 0.obs;
  void changePage(index) => this.index.value = index;
}
