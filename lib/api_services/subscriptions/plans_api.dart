// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/pland_model.dart';

class PlansApi extends GetxController {
  var mydata;
  Future<dynamic> fetchApi({planId}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(msg: 'No Internet Connection');
//msg = 'No Internet Connection';
    } else {
      try {
        var dio = Dio();

        final response =
            await dio.get('${API_END_POINt}get_plans', queryParameters: {
          'plan_id': planId,
        });
        if (response.statusCode == 200) {
          mydata = PlansModel.fromJson(jsonDecode(response.data));
        }
      } catch (e) {
        if (e is DioException) {
          //  msg = ApiErrorHandler.handleDioException(e);
        } else {
          // msg = e.toString();
        }
        // msg = e.toString();
      }
    }
    return mydata;
  }
}
