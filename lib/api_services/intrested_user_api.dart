// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:get/state_manager.dart';

import 'package:property_app/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/intrested_user_model.dart';
import '../services/api_error_handler.dart';

class IntrestedUserApi extends GetxController {
  var loginId;
  late String msg;
  var mydata;
  Future<dynamic> fetchApi({
    propertyid,
  }) async {
    try {
      var dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      loginId = prefs.getString('userId');

      final response = await dio.get(
        '${API_END_POINt}get_interests',
        queryParameters: {'property_id': propertyid, 'login_id': loginId},
      );
      if (response.statusCode == 200) {
        mydata = IntrestedUserModel.fromJson(jsonDecode(response.data));
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
