class SignUpModal {
  int? status;
  String? message;
  dynamic data;

  SignUpModal({this.status, this.message, this.data});

  SignUpModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] is! List) {
      data = json['data'] != null ? Data.fromJson(json['data']) : null;
    }
    if (json['data'] is List) {
      data = [];
    }
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
  String? type;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? password;
  String? userCode;
  String? referralCode;

  int? userId;

  Data(
      {this.uniqueId,
      this.type,
      this.name,
      this.mobile,
      this.email,
      this.address,
      this.password,
      this.userCode,
      this.referralCode,
      this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    uniqueId = json['unique_id'];
    type = json['type'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
    userCode = json['user_code'];
    referralCode = json['referral_code'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unique_id'] = uniqueId;
    data['type'] = type;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['address'] = address;
    data['password'] = password;
    data['user_code'] = userCode;
    data['referral_code'] = referralCode;
    data['user_id'] = userId;
    return data;
  }
}
