// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:property_app/constant/constants.dart';

class AreaApi extends GetxController {
  late Future<List<Area>> areaList;

  Future<List<Area>> fetchAreas(cityId) async {
    var dio = Dio();
    final response =
        await dio.get('${API_END_POINt}get_areas_wise_city', queryParameters: {
      'city_id': cityId,
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.data)['data'];
      return data.map((json) => Area.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}

class Area {
  final String cityId;
  final String name;

  Area({
    required this.cityId,
    required this.name,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      cityId: json['area_id'],
      name: json['name'],
    );
  }
}
