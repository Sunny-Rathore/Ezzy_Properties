// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class FilterController extends GetxController {
  RxDouble slidervalue = 0.0.obs;
  RxInt propertie_Choice = 0.obs;
  RxInt noOfBadRooms = 1.obs;
  RxInt noOfBathrooms = 1.obs;
  RxInt ageOfProperty = 0.obs;
  RxInt furnished = 0.obs;
  RxInt isResevedPrking = 0.obs;
  RxInt floors = 0.obs;
  RxInt construction = 0.obs;
  RxInt roomSize = 0.obs;
  Rx<String?> selectedType = Rx<String?>(null);
  Rx<String?> selectedAreaType = Rx<String?>(null);
  RxString areaType = 'sq.fit.'.obs;
  void onAreaChanged(val) {
    areaType.value = val;
  }

  void changeValue(val) {
    slidervalue.value = val;
  }

  void changeChoise(val) {
    propertie_Choice.value = val;
  }

  void changeSize(val) {
    roomSize.value = val;
  }

  void changeNoOfBadRooms(val) {
    noOfBadRooms.value = val;
  }

  void changeNoOfBathrooms(val) {
    noOfBathrooms.value = val;
  }

  void changeAgeofProperty(val) {
    ageOfProperty.value = val;
  }

  void changeFurnishingDetials(val) {
    furnished.value = val;
  }

  void changeResevedParking(val) {
    isResevedPrking.value = val;
  }

  void changeFloorDetils(val) {
    floors.value = val;
  }

  void changeConstruction(val) {
    construction.value = val;
  }
}
