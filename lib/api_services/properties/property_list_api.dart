// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:property_app/constant/constants.dart';
import 'package:property_app/model/property_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api_error_handler.dart';

class ProPertListApi extends GetxController {
  List allPropertiesList = [].obs;
  late String msg;
  var mydata;

  Future<dynamic> fetchApi(
      {propertyid, address, propertytypeid, maxprice, minPrice}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userId');
    try {
      var dio = Dio();
      final response = await dio
          .get('${API_END_POINt}fetch_allproperties', queryParameters: {
        'property_id': propertyid,
        'address': address,
        'property_type_id': propertytypeid,
        'min_price': minPrice,
        'max_price': maxprice,
        'use_id': userid,
      });
      if (response.statusCode == 200) {
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

  @override
  void onInit() async {
    super.onInit();
    var allProperty = await fetchApi();
    allPropertiesList.addAll(allProperty.data);
    
  }
}
