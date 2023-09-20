class MackersModel {
  int? status;
  String? message;
  List<Data>? data;

  MackersModel({this.status, this.message, this.data});

  MackersModel.fromJson(Map<String, dynamic> json) {
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
  String? uniqueId;
  String? type;
  String? name;
  String? dob;
  String? email;
  String? password;
  String? address;
  String? mobile;
  String? userImage;
  String? lookingFor;
  String? propertyKing;
  String? propertyTypeId;
  String? otp;
  String? planId;
  String? availablePosts;
  String? availableProfileViews;
  String? expiryDate;
  String? isActive;
  String? entrydt;
  String? review;
  String? pages;
  String? permission;
  String? userCode;
  String? referralCode;
  String? refLink;

  Data(
      {this.userId,
      this.uniqueId,
      this.type,
      this.name,
      this.dob,
      this.email,
      this.password,
      this.address,
      this.mobile,
      this.userImage,
      this.lookingFor,
      this.propertyKing,
      this.propertyTypeId,
      this.otp,
      this.planId,
      this.availablePosts,
      this.availableProfileViews,
      this.expiryDate,
      this.isActive,
      this.entrydt,
      this.review,
      this.pages,
      this.permission,
      this.userCode,
      this.referralCode,
      this.refLink});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    uniqueId = json['unique_id'];
    type = json['type'];
    name = json['name'];
    dob = json['dob'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    mobile = json['mobile'];
    userImage = json['user_image'];
    lookingFor = json['looking_for'];
    propertyKing = json['property_king'];
    propertyTypeId = json['property_type_id'];
    otp = json['otp'];
    planId = json['plan_id'];
    availablePosts = json['available_posts'];
    availableProfileViews = json['available_profile_views'];
    expiryDate = json['expiry_date'];
    isActive = json['is_active'];
    entrydt = json['entrydt'];
    review = json['review'];
    pages = json['pages'];
    permission = json['permission'];
    userCode = json['user_code'];
    referralCode = json['referral_code'];
    refLink = json['ref_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['unique_id'] = uniqueId;
    data['type'] = type;
    data['name'] = name;
    data['dob'] = dob;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    data['mobile'] = mobile;
    data['user_image'] = userImage;
    data['looking_for'] = lookingFor;
    data['property_king'] = propertyKing;
    data['property_type_id'] = propertyTypeId;
    data['otp'] = otp;
    data['plan_id'] = planId;
    data['available_posts'] = availablePosts;
    data['available_profile_views'] = availableProfileViews;
    data['expiry_date'] = expiryDate;
    data['is_active'] = isActive;
    data['entrydt'] = entrydt;
    data['review'] = review;
    data['pages'] = pages;
    data['permission'] = permission;
    data['user_code'] = userCode;
    data['referral_code'] = referralCode;
    data['ref_link'] = refLink;
    return data;
  }
}
