import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/ask_quetions/ask_questions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskQuestionsApi extends GetxController {
  final TextEditingController questionsController = TextEditingController();
  late String msg;

  Future<String> fetchApi(propertyId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      final formData = FormData.fromMap({
        'user_id': userId,
        'property_id': propertyId,
        'questions': questionsController.text,
      });

      var dio = Dio();
      var response =
          await dio.post('${API_END_POINt}ask_questions', data: formData);
      if (response.statusCode == 200) {
        var mydata = AskQuestionsModel.fromJson(jsonDecode(response.data));
        msg = mydata.message.toString();
      }
    }
    return msg;
  }
}
