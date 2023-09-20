class LoginModel {
  int? status;
  String? message;
  List<Data>? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? name;
  String? email;
  String? password;
  String? address;
  String? mobile;
  String? type;
  String? userImage;
  String? lookingFor;
  String? propertyKing;
  String? propertyTypeId;
  String? otp;
  String? planId;
  String? expiryDate;
  String? isActive;
  String? entrydt;
  String? latitude;
  String? longitude;
  String? socialType;
  String? socialId;
  String? review;
  String? referralcode;
  String? userCode;

  Data(
      {this.userId,
      this.name,
      this.email,
      this.password,
      this.address,
      this.mobile,
      this.type,
      this.userImage,
      this.lookingFor,
      this.propertyKing,
      this.propertyTypeId,
      this.otp,
      this.planId,
      this.expiryDate,
      this.isActive,
      this.entrydt,
      this.latitude,
      this.longitude,
      this.socialType,
      this.socialId,
      this.referralcode,
      this.userCode,
      this.review});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    mobile = json['mobile'];
    type = json['type'];
    userImage = json['user_image'];
    lookingFor = json['looking_for'];
    propertyKing = json['property_king'];
    propertyTypeId = json['property_type_id'];
    otp = json['otp'];
    planId = json['plan_id'];
    expiryDate = json['expiry_date'];
    isActive = json['is_active'];
    entrydt = json['entrydt'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    socialType = json['social_type'];
    socialId = json['social_id'];
    review = json['review'];
    userCode = json['user_code'];
    referralcode = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['mobile'] = mobile;
    data['type'] = type;
    data['user_image'] = userImage;
    data['looking_for'] = lookingFor;
    data['property_king'] = propertyKing;
    data['property_type_id'] = propertyTypeId;
    data['otp'] = otp;
    data['plan_id'] = planId;
    data['expiry_date'] = expiryDate;
    data['is_active'] = isActive;
    data['entrydt'] = entrydt;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['social_type'] = socialType;
    data['social_id'] = socialId;
    data['review'] = review;
    data['user_code'] = userCode;
    data['referral_code'] = referralcode;
    return data;
  }
}
