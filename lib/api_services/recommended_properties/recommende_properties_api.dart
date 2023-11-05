// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/property_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/api_error_handler.dart';

class RecommendePropertiesApi extends GetxController {
  late String msg;
  var mydata;

  Future<dynamic> fetchApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userId');
    try {
      var dio = Dio();
      final response = await dio
          .get('${API_END_POINt}get_recommended_properties', queryParameters: {
        'login_id': userid,
      });
      if (response.statusCode == 200) {
        mydata = PropertyListModel.fromJson(jsonDecode(response.data));
      }
    } catch (e) {
      debugPrint('Projects Properties ERROR: $e');
      if (e is DioException) {
        msg = ApiErrorHandler.handleDioException(e);
      } else {
        msg = e.toString();
      }
      msg = e.toString();
    }

    return mydata;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchApi();
  }
}
