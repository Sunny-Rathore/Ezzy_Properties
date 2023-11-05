// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/api_error_handler.dart';
import '../../model/fav_property_model/fav_property_model.dart';

class FavPropertyApi extends GetxController {
  late String msg;
  var mydata;

  Future<dynamic> fetchApi({properyid, status}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userId');

    var formData = FormData.fromMap({
      'user_id': userid,
      'property_id': properyid,
      'status': status,
    });
    try {
      var dio = Dio();

      final response = await dio.post('${API_END_POINt}favourite_properties',
          data: formData);

      if (response.statusCode == 200) {
        mydata = FavoritePropertyModel.fromJson(jsonDecode(response.data));
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
