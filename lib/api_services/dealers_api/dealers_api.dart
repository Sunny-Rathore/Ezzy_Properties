// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/dealer_model/dealer_model.dart';

import '../../../services/api_error_handler.dart';

class DealersApi extends GetxController {
  late String msg;
  var mydata;

  Future<dynamic> fetchApi() async {
    try {
      var dio = Dio();
      final response = await dio.get('${API_END_POINt}get_verify_dealers');
      print(response.data);
      if (response.statusCode == 200) {
        mydata = DealersModel.fromJson(jsonDecode(response.data));
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
