// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:property_app/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/constants.dart';
import '../../model/profile_model.dart';
import '../../services/api_error_handler.dart';

class ProfileApi extends GetxController {
  final AuthController authController = Get.find();

  late String msg;
  var mydata;
  Future<dynamic> fetchApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userId');

    try {
      var dio = Dio();
      final response =
          await dio.get('${API_END_POINt}get_profile', queryParameters: {
        'user_id': userid,
      });
      if (response.statusCode == 200) {
        mydata = ProfileModel.fromJson(jsonDecode(response.data));
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
