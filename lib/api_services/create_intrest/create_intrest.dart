// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/create_intrested/ceate_intrested_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateIntrestApi extends GetxController {
  var msg;

  Future<String> fetchApi(propertyId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      var fromData = FormData.fromMap({
        'user_id': userId,
        'property_id': propertyId,
      });
      var dio = Dio();
      var response =
          await dio.post('${API_END_POINt}create_interests', data: fromData);
      if (response.statusCode == 200) {
        print(response.data);
        var mydata = CreateIntrested.fromJson(jsonDecode(response.data));
        msg = mydata.message;
      }
    }
    return msg;
  }
}
