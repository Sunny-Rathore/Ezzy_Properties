import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/model/auth/sign_up_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/api_error_handler.dart';

class SignUpApi extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final AuthController authController = Get.find();
  final apiResponse = Rx<SignUpModal?>(null);

  late String msg;
  Future<String> fetchApi(
      {required userType,
      required mobileNumber,
      required password,
      email,
      name,
      address}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      try {
        var dio = Dio();
        final formData = FormData.fromMap({
          'type': userType,
          'mobile': mobileNumber,
          'password': password,
          'email': email,
          'address': address,
          'name': name,
          'referral_code': '',
        });
        final response =
            await dio.post('${API_END_POINt}signup', data: formData);
        if (response.statusCode == 200) {
          var data = SignUpModal.fromJson(jsonDecode(response.data));
          apiResponse.value = data;
          if (data.message == 'Success') {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('userId', data.data!.userId.toString());
            await prefs.setString('CODE', data.data!.userCode);

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
