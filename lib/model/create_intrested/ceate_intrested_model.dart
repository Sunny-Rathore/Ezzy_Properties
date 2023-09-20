class CreateIntrested {
  int? status;
  String? message;
  Data? data;

  CreateIntrested({this.status, this.message, this.data});

  CreateIntrested.fromJson(Map<String, dynamic> json) {
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
  String? propertyId;
  int? interestId;

  Data({this.userId, this.propertyId, this.interestId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    propertyId = json['property_id'];
    interestId = json['interest_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['property_id'] = propertyId;
    data['interest_id'] = interestId;
    return data;
  }
}
