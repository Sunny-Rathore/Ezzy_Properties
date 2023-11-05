// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:property_app/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/get_fav_propeties/get_fav_properties_model.dart';
import '../../services/api_error_handler.dart';

class GetFavPropertiesApi extends GetxController {
  late String msg;
  var mydata;
  Future<dynamic> fetchApi() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userid = prefs.getString('userId');
      var dio = Dio();
      final response = await dio
          .get('${API_END_POINt}get_favourite_properties', queryParameters: {
        'user_id': userid,
        'login_id': userid,
      });
      if (response.statusCode == 200) {
        mydata = GetFavoritePropertyModel.fromJson(jsonDecode(response.data));
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
