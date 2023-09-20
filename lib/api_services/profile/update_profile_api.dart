// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/controller/image_picker_controller/image_picker.dart';
import 'package:property_app/model/profile/update_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constants.dart';
import '../../services/api_error_handler.dart';

class UpdateProfileApi extends GetxController {
  final AuthController authController = Get.find();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late String msg;
  var mydata;
  Future<dynamic> fetchApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imagePickerController = Get.put(ImagePickerController());
    var userid = prefs.getString('userId');
    FormData formData = FormData.fromMap({
      'user_id': userid,
      'name': 'Sunny',
      //nameController.text,
      'email': emailController.text,
      'address': addressController.text,
      'mobile': mobileController.text,
      'user_image': await MultipartFile.fromFile(
          imagePickerController.selectedImagePath.value,
          filename: 'Userprofile'),
    });
    try {
      var dio = Dio();
      final response =
          await dio.post('${API_END_POINt}update_profile', data: formData);
      if (response.statusCode == 200) {
        mydata = UpdateProfileModal.fromJson(jsonDecode(response.data));
      }
    } catch (e) {
      if (e is DioException) {
        msg = ApiErrorHandler.handleDioException(e);
      } else {
        msg = e.toString();
      }
      msg = e.toString();
    }
    return mydata;
  }
}
