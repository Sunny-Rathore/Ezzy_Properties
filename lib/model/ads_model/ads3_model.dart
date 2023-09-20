class Ads3Model {
  int? status;
  String? message;
  List<Data>? data;

  Ads3Model({this.status, this.message, this.data});

  Ads3Model.fromJson(Map<String, dynamic> json) {
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
  String? adsShowType;
  String? files;
  String? type;
  String? status;
  String? entrydt;

  Data(
      {this.adsId,
      this.uniqueId,
      this.adsShowType,
      this.files,
      this.type,
      this.status,
      this.entrydt});

  Data.fromJson(Map<String, dynamic> json) {
    adsId = json['ads_id'];
    uniqueId = json['unique_id'];
    adsShowType = json['ads_show_type'];
    files = json['files'];
    type = json['type'];
    status = json['status'];
    entrydt = json['entrydt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ads_id'] = adsId;
    data['unique_id'] = uniqueId;
    data['ads_show_type'] = adsShowType;
    data['files'] = files;
    data['type'] = type;
    data['status'] = status;
    data['entrydt'] = entrydt;
    return data;
  }
}
