// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';

import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/property_type_model.dart';

import '../../services/api_error_handler.dart';

class ProPertyTypeApi extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String msg;
  RxList catName = [].obs;
  var mydata;
  Future<dynamic> fetchPropertyType() async {
    try {
      var dio = Dio();
      final response = await dio.get(
        '${API_END_POINt}get_property_type',
      );
      if (response.statusCode == 200) {
        mydata = PropertyTypeModel.fromJson(jsonDecode(response.data));
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
