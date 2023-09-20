class IntrestedUserModel {
  int? status;
  String? message;
  List<Data>? data;

  IntrestedUserModel({this.status, this.message, this.data});

  IntrestedUserModel.fromJson(Map<String, dynamic> json) {
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
  String? interestId;
  String? userId;
  String? propertyId;
  String? interestUserPay;
  String? entrydt;
  String? name;
  String? mobile;
  String? email;
  String? interestUserImage;
  String? timeAgo;
  String? viewed;

  Data(
      {this.interestId,
      this.userId,
      this.propertyId,
      this.interestUserPay,
      this.entrydt,
      this.name,
      this.mobile,
      this.email,
      this.interestUserImage,
      this.viewed,
      this.timeAgo});

  Data.fromJson(Map<String, dynamic> json) {
    interestId = json['interest_id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    interestUserPay = json['interest_user_pay'];
    entrydt = json['entrydt'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    viewed = json['viewed'];
    interestUserImage = json['interest_user_image'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interest_id'] = interestId;
    data['user_id'] = userId;
    data['property_id'] = propertyId;
    data['interest_user_pay'] = interestUserPay;
    data['entrydt'] = entrydt;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['interest_user_image'] = interestUserImage;
    data['time_ago'] = timeAgo;
    data['viewed'] = timeAgo;
    return data;
  }
}
