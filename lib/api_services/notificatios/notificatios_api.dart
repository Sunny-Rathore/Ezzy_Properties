// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/notificatios/notificatios_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsApi extends GetxController {
  final TextEditingController questionsController = TextEditingController();
  var mydata;

  Future<dynamic> fetchApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');

    var dio = Dio();
    var response =
        await dio.get('${API_END_POINt}get_reply_questions', queryParameters: {
      'user_id': userId,
    });
    if (response.statusCode == 200) {
      mydata = NotificationsModel.fromJson(jsonDecode(response.data));
    }

    return mydata;
  }
}
