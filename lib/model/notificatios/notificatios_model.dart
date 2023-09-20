class NotificationsModel {
  int? status;
  String? message;
  List<Data>? data;

  NotificationsModel({this.status, this.message, this.data});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
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
  String? questionId;
  String? userId;
  String? propertyId;
  String? questions;
  String? replyQuestions;
  String? entrydt;
  String? userName;
  String? userMobile;
  String? userType;
  String? propertyName;
  String? propertyAddress;

  Data(
      {this.questionId,
      this.userId,
      this.propertyId,
      this.questions,
      this.replyQuestions,
      this.entrydt,
      this.userName,
      this.userMobile,
      this.userType,
      this.propertyName,
      this.propertyAddress});

  Data.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    questions = json['questions'];
    replyQuestions = json['reply_questions'];
    entrydt = json['entrydt'];
    userName = json['user_name'];
    userMobile = json['user_mobile'];
    userType = json['user_type'];
    propertyName = json['property_name'];
    propertyAddress = json['property_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['user_id'] = userId;
    data['property_id'] = propertyId;
    data['questions'] = questions;
    data['reply_questions'] = replyQuestions;
    data['entrydt'] = entrydt;
    data['user_name'] = userName;
    data['user_mobile'] = userMobile;
    data['user_type'] = userType;
    data['property_name'] = propertyName;
    data['property_address'] = propertyAddress;
    return data;
  }
}
