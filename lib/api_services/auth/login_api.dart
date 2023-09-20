import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/api_error_handler.dart';

class LoginApi extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find();
  final apiResponse = Rx<LoginModel?>(null);

  late String msg;
  Future<String> fetchLogin(
      {required userType, required mobileNumber, required password}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      try {
        var dio = Dio();
        final formData = FormData.fromMap(
            {'type': userType, 'mobile': mobileNumber, 'password': password});
        final response =
            await dio.post('${API_END_POINt}login', data: formData);
        if (response.statusCode == 200) {
          var data = LoginModel.fromJson(jsonDecode(response.data));
          apiResponse.value = data;
          if (data.message == 'Success') {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('userId', data.data![0].userId.toString());
            await prefs.setString('CODE', data.data![0].userCode.toString());
            authController.getUserdata();
          }
          msg = apiResponse.value!.message.toString();
        }
      } catch (e) {
        if (e is DioException) {
          msg = ApiErrorHandler.handleDioException(e);
        } else {
          msg = e.toString();
        }
        msg = e.toString();
      }
    }
    return msg;
  }
}
