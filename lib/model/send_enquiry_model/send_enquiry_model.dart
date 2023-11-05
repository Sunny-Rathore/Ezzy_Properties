class sendEnquiryModel {
  int? status;
  String? message;
  Data? data;

  sendEnquiryModel({this.status, this.message, this.data});

  sendEnquiryModel.fromJson(Map<String, dynamic> json) {
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
  String? uniqueId;
  String? enquiryUserId;
  String? userId;
  String? fullName;
  String? mobile;
  String? email;
  String? address;
  String? budget;
  String? duration;
  String? projectType;
  String? description;
  int? enquryId;

  Data(
      {this.uniqueId,
      this.enquiryUserId,
      this.userId,
      this.fullName,
      this.mobile,
      this.email,
      this.address,
      this.budget,
      this.duration,
      this.projectType,
      this.description,
      this.enquryId});

  Data.fromJson(Map<String, dynamic> json) {
    uniqueId = json['unique_id'];
    enquiryUserId = json['enquiry_user_id'];
    userId = json['user_id'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    budget = json['budget'];
    duration = json['duration'];
    projectType = json['project_type'];
    description = json['description'];
    enquryId = json['enqury_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unique_id'] = uniqueId;
    data['enquiry_user_id'] = enquiryUserId;
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['address'] = address;
    data['budget'] = budget;
    data['duration'] = duration;
    data['project_type'] = projectType;
    data['description'] = description;
    data['enqury_id'] = enquryId;
    return data;
  }
}
