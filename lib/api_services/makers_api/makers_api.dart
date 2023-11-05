// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/makers_model/makers_model.dart';

import '../../../services/api_error_handler.dart';

class MakersApi extends GetxController {
  late String msg;
  var mydata;

  Future<dynamic> fetchApi({type, area, city}) async {
    try {
      var dio = Dio();
      final response = await dio.get('${API_END_POINt}get_makers_byArea',
          queryParameters: {'type': type, 'Area': area});
      if (response.statusCode == 200) {
        mydata = MakersModel.fromJson(jsonDecode(response.data));
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
