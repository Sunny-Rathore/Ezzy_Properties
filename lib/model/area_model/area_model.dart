class AreaModel {
  int? status;
  String? message;
  List<Data>? data;

  AreaModel({this.status, this.message, this.data});

  AreaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? areaId;
  String? uniqueId;
  String? cityId;
  String? name;
  String? entrydt;
  String? isActive;

  Data(
      {this.areaId,
      this.uniqueId,
      this.cityId,
      this.name,
      this.entrydt,
      this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id'];
    uniqueId = json['unique_id'];
    cityId = json['city_id'];
    name = json['name'];
    entrydt = json['entrydt'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['area_id'] = areaId;
    data['unique_id'] = uniqueId;
    data['city_id'] = cityId;
    data['name'] = name;
    data['entrydt'] = entrydt;
    data['is_active'] = isActive;
    return data;
  }
}
