import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/send_enquiry_model/send_enquiry_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/api_error_handler.dart';

class SendEnquiryApi extends GetxController {
  // @override
  // void onClose() {
  //   super.onClose();
  //   nameController.clear();
  //   phoneController.clear();
  //   emailController.clear();
  //   addressController.clear();
  //   budetController.clear();
  //   durationController.clear();
  //   projectTypeController.clear();
  //   descriptionController.clear();
  // }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController budetController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController projectTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final apiResponse = Rx<sendEnquiryModel?>(null);

  late String msg;
  Future<String> fetchApi(makerId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var userId = prefs.getString('userId');
        var dio = Dio();
        final formData = FormData.fromMap({
          'login_id': '4',
          //userId,
          'user_id': '1',
          'full_name': nameController.text,
          'email': emailController.text,
          'address': addressController.text,
          'budget': budetController.text,
          'duration': durationController.text,
          'project_type': projectTypeController.text,
          'description': descriptionController.text,
        });

        final response =
            await dio.post('${API_END_POINt}send_enquiry', data: formData);
        print('response');
        print(response.data);
        if (response.statusCode == 200) {
          var data = sendEnquiryModel.fromJson(jsonDecode(response.data));
          apiResponse.value = data;
          if (data.message == 'Success') {}
          msg = apiResponse.value!.message.toString();
        }
      } catch (e) {
        if (e is DioException) {
          print(e.response);
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
