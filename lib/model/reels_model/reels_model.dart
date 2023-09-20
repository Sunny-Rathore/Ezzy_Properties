class ReelsModel {
  int? status;
  String? message;
  List<Data>? data;

  ReelsModel({this.status, this.message, this.data});

  ReelsModel.fromJson(Map<String, dynamic> json) {
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
  String? reelId;
  String? uniqueId;
  String? type;
  String? reels;
  String? description;
  String? status;

  Data(
      {this.reelId,
      this.uniqueId,
      this.type,
      this.reels,
      this.description,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    reelId = json['reel_id'];
    uniqueId = json['unique_id'];
    type = json['type'];
    reels = json['reels'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reel_id'] = reelId;
    data['unique_id'] = uniqueId;
    data['type'] = type;
    data['reels'] = reels;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}
