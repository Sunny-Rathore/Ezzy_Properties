// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:property_app/constant/constants.dart';

import '../../model/ads_model/ads3_model.dart';
import '../../services/api_error_handler.dart';

class Ads3Api extends GetxController {
  late String msg;
  var mydata;

  Future<dynamic> fetchApi() async {
    try {
      var dio = Dio();
      final response = await dio.get(
        '${API_END_POINt}get_displayADs_3',
      );
      if (response.statusCode == 200) {
        mydata = Ads3Model.fromJson(jsonDecode(response.data));
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
