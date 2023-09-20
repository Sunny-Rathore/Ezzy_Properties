import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxInt checkUser = 10.obs;
  RxString userid = ''.obs;

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
    checkUser.value = prefs.getInt('checkUser') ?? 10;
    userid.value = prefs.getString('userId') ?? '';
  }

  Future<void> login(
    userindex,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setInt('checkUser', userindex);
    isLoggedIn.value = true;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.setInt('checkUser', 10);
    await prefs.setString('userId', '');
    await prefs.setInt("id", 10);
    isLoggedIn.value = false;
    checkUser.value = 10;
    userid.value = '';
  }

  Future<String> getUserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid.value = prefs.getString('userId') ?? '';
    return userid.value;
  }

  Future<void> userdata(userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }
}
