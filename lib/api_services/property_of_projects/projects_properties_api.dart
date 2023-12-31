// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:property_app/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/projects_properties/projects_properties.dart';
import '../../services/api_error_handler.dart';

class ProjectsProPertyListApi {
  late String msg;
  var mydata;
  Future<dynamic> fetchApi({
    projectid,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userid = prefs.getString('userId');
      var dio = Dio();
      final response = await dio.get(
          '${API_END_POINt}get_projects_wise_properties',
          queryParameters: {
            'project_id': projectid,
            'user_id': userid,
          });
      if (response.statusCode == 200) {
        mydata = ProjectsPropertiesModel.fromJson(jsonDecode(response.data));
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
