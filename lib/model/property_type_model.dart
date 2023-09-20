class PropertyTypeModel {
  int? status;
  String? message;
  List<Data>? data;

  PropertyTypeModel({this.status, this.message, this.data});

  PropertyTypeModel.fromJson(Map<String, dynamic> json) {
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
  String? propertyTypeId;
  String? name;
  String? entrydt;

  Data({this.propertyTypeId, this.name, this.entrydt});

  Data.fromJson(Map<String, dynamic> json) {
    propertyTypeId = json['property_type_id'];
    name = json['name'];
    entrydt = json['entrydt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_type_id'] = propertyTypeId;
    data['name'] = name;
    data['entrydt'] = entrydt;
    return data;
  }
}
