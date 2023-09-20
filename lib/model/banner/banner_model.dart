class BannerModel {
  int? status;
  String? message;
  List<Data>? data;

  BannerModel({this.status, this.message, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
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
  String? adsId;
  String? uniqueId;
  String? files;
  String? name;
  String? mobile;
  String? type;
  String? status;
  String? entrydt;

  Data(
      {this.adsId,
      this.uniqueId,
      this.files,
      this.name,
      this.mobile,
      this.type,
      this.status,
      this.entrydt});

  Data.fromJson(Map<String, dynamic> json) {
    adsId = json['ads_id'];
    uniqueId = json['unique_id'];
    files = json['files'];
    name = json['name'];
    mobile = json['mobile'];
    type = json['type'];
    status = json['status'];
    entrydt = json['entrydt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ads_id'] = adsId;
    data['unique_id'] = uniqueId;
    data['files'] = files;
    data['name'] = name;
    data['mobile'] = mobile;
    data['type'] = type;
    data['status'] = status;
    data['entrydt'] = entrydt;
    return data;
  }
}
