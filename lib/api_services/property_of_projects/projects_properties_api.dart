// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/property_list_model.dart';

import '../../services/api_error_handler.dart';

class ProjectsProPertyListApi extends GetxController {
  late String msg;
  var mydata;
  Future<dynamic> fetchApi({
    projectid,
  }) async {
    try {
      var dio = Dio();
      final response = await dio.get(
          '${API_END_POINt}get_projects_wise_properties',
          queryParameters: {
            'project_id': projectid,
          });
      if (response.statusCode == 200) {
        // print(response.data);
        mydata = PropertyListModel.fromJson(jsonDecode(response.data));
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
