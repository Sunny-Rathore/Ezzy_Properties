class CityModel {
  int? status;
  String? message;
  List<Data>? data;

  CityModel({this.status, this.message, this.data});

  CityModel.fromJson(Map<String, dynamic> json) {
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
  String? cityId;
  String? name;
  String? stateId;

  Data({this.cityId, this.name, this.stateId});

  Data.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    name = json['name'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['name'] = name;
    data['state_id'] = stateId;
    return data;
  }
}
