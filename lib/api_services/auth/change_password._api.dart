import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/auth/change_password_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/api_error_handler.dart';

class ChangePasswordApi extends GetxController {
  @override
  void onClose() {
    super.onClose();
    confirmpasswordController.clear();
    newPasswordController.clear();
    oldPasswordController.clear();
  }

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  final apiResponse = Rx<ChangePasswordModal?>(null);

  late String msg;
  Future<String> fetchApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var userId = prefs.getString('userId');
        var dio = Dio();
        final formData = FormData.fromMap({
          'user_id': userId,
          'old_password': oldPasswordController.text,
          'new_password': newPasswordController.text,
          'confirm_password': confirmpasswordController.text,
        });
        final response =
            await dio.post('${API_END_POINt}change_password', data: formData);
        if (response.statusCode == 200) {
          var data = ChangePasswordModal.fromJson(jsonDecode(response.data));
          apiResponse.value = data;
          if (data.message == 'Success') {}
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
