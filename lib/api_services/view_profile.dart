// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/view_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api_error_handler.dart';

class ViewProfileApi extends GetxController {
  late String msg;
  var mydata;

  Future<dynamic> fetchApi(intrestedUderId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      try {
        var dio = Dio();
        final response =
            await dio.get('${API_END_POINt}view_profile', queryParameters: {
          'login_id': userId,
          'user_id': intrestedUderId,
        });
        if (response.statusCode == 200) {
          mydata = ViewProfileModal.fromJson(jsonDecode(response.data));
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
}
