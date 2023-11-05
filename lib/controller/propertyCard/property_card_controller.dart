import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyCardController extends GetxController {
  var isFav = RxBool(false);
  @override
  void onInit() {
    super.onInit();
    getPrefs();
  }

  RxString userid = ''.obs;
  getPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userid.value = preferences.getString('userId') ?? '';
  }
}
