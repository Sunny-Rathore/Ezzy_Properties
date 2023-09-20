class ProfileModel {
  int? status;
  String? message;
  Data? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
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
  String? isPlasActive;

  Data(
      {this.userId,
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
      this.isPlasActive});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
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
    isPlasActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
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
    data['isActive'] = isPlasActive;
    return data;
  }
}