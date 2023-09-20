// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

import 'package:property_app/model/update_property/update_property_model.dart';

import '../../constant/constants.dart';
import '../../services/api_error_handler.dart';

class UpdatePropertyApi extends GetxController {
  late String msg;
  var mydata;
  Future<String> fetchApi({required propertyId}) async {
    FormData formData = FormData.fromMap(
        {'property_id': propertyId, 'property_status': 'Sold'});
    try {
      var dio = Dio();
      final response =
          await dio.post('${API_END_POINt}update_properties', data: formData);
      if (response.statusCode == 200) {
        var mydata = UpdatePropertyModel.fromJson(jsonDecode(response.data));
        msg = mydata.message!;
      }
    } catch (e) {
      if (e is DioException) {
        msg = ApiErrorHandler.handleDioException(e);
      } else {
        msg = e.toString();
      }
      msg = e.toString();
    }
    return msg;
  }
}
