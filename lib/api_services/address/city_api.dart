// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:property_app/constant/constants.dart';

class CityApi extends GetxController {
  @override
  void onInit() {
    super.onInit();
    cityList = fetchCities();
  }

  late Future<List<City>> cityList;

  Future<List<City>> fetchCities() async {
    var dio = Dio();
    final response = await dio.get(
      '${API_END_POINt}get_cities',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.data)['data'];
      return data.map((json) => City.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}

class City {
  final String cityId;
  final String name;
  final String stateId;

  City({required this.cityId, required this.name, required this.stateId});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json['city_id'],
      name: json['name'],
      stateId: json['state_id'],
    );
  }
}
