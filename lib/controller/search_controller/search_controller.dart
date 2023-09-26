// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/properties/post_property_api.dart';

import '../../api_services/address/city_api.dart';
import '../../api_services/properties/property_list_api.dart';

class SearchfiltterController extends GetxController {
  var postPropertyController = Get.put(PostPropertyApi());
  final propertyListController = Get.put(ProPertListApi());
  TextEditingController searchCityController = TextEditingController();
  final TextEditingController minPrice = TextEditingController();
  final TextEditingController maxPrice = TextEditingController();
  var choice = RxString('Buy');
  var type = RxString('1');
  var isLoading = RxBool(false);
  RxList cityList = [].obs;

  RxList addedCity = [].obs;

  //? facing Direction
  RxString facingDirection = 'North'.obs;
  onDirectionChange(String direction) => facingDirection.value = direction;
  Future laodCity() async {
    cityList.clear();
    final cityApi = Get.put(CityApi());
    List<City> cities = await cityApi.fetchCities();

    cityList.addAll(cities);
  }

//? Types of Plots/lands
  RxString typesOfPlotLand = 'Commerecial Land/inst. Land'.obs;
  onPlotTypeChange(type) => typesOfPlotLand.value = type;
//? Posted By

  RxString postedBy = 'Builder'.obs;
  onPostedChange(name) => postedBy.value = name;

//? add and remove City
  addcity(name) {
    if (!addedCity.contains(name)) {
      addedCity.add(name);
    }
  }

  removeCity(index) => addedCity.removeAt(index);

  RxInt choiceIndex = 0.obs;
  RxInt typeindex = 0.obs;

  void onTypeChage(index) {
    typeindex.value = index;
  }

  void onChoiceChage(index) {
    choiceIndex.value = index;
  }

  RxString selectedCityId = ''.obs;

  RxList dataList = [].obs;
  var mydata;
  onSubmit() {
    // print('object');
    // print('For: $choice');
    // print('type: $type');
    // print('city: ${postPropertyController.selectedCityId}');
    dataList.clear();
    isLoading(true);
    propertyListController
        .fetchApi(
            maxprice: maxPrice.text,
            minPrice: minPrice.text,
            propertytypeid: type.value)
        .then((value) {
      mydata = value;

      dataList.addAll(value.data);
      isLoading(false);
    });
  }

  @override
  void onClose() {
    super.onClose();
    dataList.clear();
  }
}
