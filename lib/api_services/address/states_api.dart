// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:property_app/constant/constants.dart';

class StateApi extends GetxController {
  @override
  void onInit() {
    super.onInit();
    stateList = fetchCities();
  }

  RxString? selectedState = ''.obs;

  late Future<List<States>> stateList;

  Future<List<States>> fetchCities() async {
    var dio = Dio();
    final response = await dio.get(
      '${API_END_POINt}get_states',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.data)['data'];
      return data.map((json) => States.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }
}

class States {
  final String name;
  final String stateId;

  States({required this.name, required this.stateId});

  factory States.fromJson(Map<String, dynamic> json) {
    return States(
      name: json['name'],
      stateId: json['state_id'],
    );
  }
}
