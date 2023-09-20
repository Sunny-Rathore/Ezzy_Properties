// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/referalModel/referal_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api_error_handler.dart';

class ReferalApi extends GetxController {
  late String msg;
  var mydata;

  Future<dynamic> fetchApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');

    try {
      var dio = Dio();
      final response =
          await dio.get('${API_END_POINt}get_referrals', queryParameters: {
        'user_id': userId,
        //userId,
      });
      if (response.statusCode == 200) {
        mydata = RefralModel.fromJson(jsonDecode(response.data));
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
