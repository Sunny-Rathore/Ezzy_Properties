// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:property_app/constant/constants.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/model/post_property_type_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/image_picker_controller/image_picker.dart';
import '../../services/api_error_handler.dart';

class PostPropertyApi extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController propertynameController = TextEditingController();
  TextEditingController propertyPriceController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final AuthController authController = Get.find();
  final apiResponse = Rx<PostPropertyModel?>(null);
  RxBool loading = false.obs;
  var mycity = ''.obs;
  RxString selectedCityId = ''.obs;
  RxString selectedStateId = ''.obs;
  RxString numOfBedrooms = '1'.obs;
  RxString numOfBathRooms = '1'.obs;
  RxString ageOfProperty = 'New Construction'.obs;
  RxString furnishing = 'Un Furnished'.obs;
  RxString haveReservParking = 'Yes'.obs;
  RxString constructionStatus = 'Ready To Move'.obs;

  RxString areaTypeId = 'SQFT'.obs;

  void onAreaChanged(String val) {
    areaTypeId.value = val;
  }

  void setmycity(String val) {
    mycity.value = val;
  }

  void getConstructionStatus(val) {
    constructionStatus.value = val;
  }

  void isReservParking(val) {
    haveReservParking.value = val;
  }

  void getFurnishDetail(val) {
    furnishing.value = val;
  }

  void getAgeOfProperty(val) {
    ageOfProperty.value = val;
  }

  void bedRoomCount(val) {
    numOfBedrooms.value = val;
  }

  void bathRoomCount(val) {
    numOfBathRooms.value = val;
  }

  void selectCity(cityId) {
    selectedCityId.value = cityId;
  }

  void selectState(cityId) {
    selectedStateId.value = cityId;
  }

  late String msg;
  var mydata;

  Future<String> fetchApi({postedFor, poperyTypeId, propertkind}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      msg = 'No Internet Connection';
    } else {
      try {
        final imagePickerController = Get.put(ImagePickerController());
        var dio = Dio();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var userid = prefs.getString('userId');
        loading.value = true;
        // Map<String, dynamic> formDataMap = {
        //   'user_id': userid,
        //   'property_name': propertynameController.text,
        //   'city_id': selectedCityId,
        //   'posted_for': postedFor,
        //   'state_id': selectedStateId.value,
        //   'address': addressController.text,
        //   'area': areaController.text,
        //   'area_type_id': areaTypeId.value,
        //   'price': propertyPriceController.text,
        //   'thumbnail_image': await MultipartFile.fromFile(
        //       imagePickerController.selectedImagePath.value,
        //       filename: 'proPertyImage'),
        //   'no_of_bedrooms': numOfBedrooms.value,
        //   'no_of_bathrooms': numOfBathRooms.value,
        //   'property_age': ageOfProperty.value,
        //   'have_reserved_parking': haveReservParking.value,
        //   'furnishing': furnishing.value,
        //   'floors': 'totsl floor',
        //   'construction_status': constructionStatus,
        //   'property_type_id': '1',
        //   'property_kind': propertkind,
        //   'parking': '1',
        //   'status': "open",
        //   'description': descriptionController.text,
        // };

        final formData = FormData.fromMap({
          'user_id': userid,
          'property_name': propertynameController.text,
          'city_id': selectedCityId,
          'posted_for': postedFor,
          'state_id': selectedStateId.value,
          'address': addressController.text,
          'area': areaController.text,
          'area_type_id': areaTypeId.value,
          'price': propertyPriceController.text,
          'thumbnail_image': await MultipartFile.fromFile(
              imagePickerController.selectedImagePath.value,
              filename: 'proPertyImage'),
          'no_of_bedrooms': numOfBedrooms.value,
          'no_of_bathrooms': numOfBathRooms.value,
          'property_age': ageOfProperty.value,
          'furnishing': furnishing.value,
          'have_reserved_parking': haveReservParking.value,
          'floors': 'totsl floor',
          'construction_status': constructionStatus,
          'property_type_id': poperyTypeId,
          'property_kind': poperyTypeId,
          'parking': '1',
          'status': "open",
          'description': descriptionController.text,
        });

        for (int i = 0;
            i < imagePickerController.selectedImagePaths.length;
            i++) {
          File imageFile = File(imagePickerController.selectedImagePaths[i]);
          formData.files.add(MapEntry(
            'files[]',
            await MultipartFile.fromFile(imageFile.path, filename: 'image$i'),
          ));
        }

        final response =
            await dio.post('${API_END_POINt}create_property', data: formData);

        if (response.statusCode == 200) {
          var data = PostPropertyModel.fromJson(jsonDecode(response.data));
          apiResponse.value = data;
          msg = apiResponse.value!.message.toString();
          loading.value = false;
        }
      } catch (e) {
        if (e is DioException) {
          msg = ApiErrorHandler.handleDioException(e);
          loading.value = false;
        } else {
          msg = e.toString();
          loading.value = false;
        }
      }
    }
    return msg;
  }
}
