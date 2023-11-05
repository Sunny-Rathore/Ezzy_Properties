// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/dealers_wise_properties/dealer_wise_properties_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/api_error_handler.dart';

class DealerWisePropertyApi extends GetxController {
  var isLoading = RxBool(false);
  var apiData = [].obs;
  var errorMsg = RxString('');
  Future<void> fetchData() async {
    isLoading(true);
    try {
      var data = await fetchApi();
      apiData.addAll(data.data);
    } catch (e) {
      errorMsg.value = e.toString();
    }
    isLoading(false);
  }

  late String msg;
  var mydata;

  Future<dynamic> fetchApi({properyid, status}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userId');

    var rawData = {
      'user_id': userid,
      'login_id': userid,
    };
    try {
      var dio = Dio();

      final response = await dio
          .get('${API_END_POINt}get_dealers_wise_properties', data: rawData);

      if (response.statusCode == 200) {
        mydata = DealersWisePropertiesModel.fromJson(jsonDecode(response.data));
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

  @override
  void onInit() async {
    super.onInit();
    await fetchData();
  }
}
