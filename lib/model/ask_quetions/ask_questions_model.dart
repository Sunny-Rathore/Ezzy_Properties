class AskQuestionsModel {
  int? status;
  String? message;
  Data? data;

  AskQuestionsModel({this.status, this.message, this.data});

  AskQuestionsModel.fromJson(Map<String, dynamic> json) {
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
  String? questions;
  int? questionId;

  Data({this.userId, this.propertyId, this.questions, this.questionId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    propertyId = json['property_id'];
    questions = json['questions'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['property_id'] = propertyId;
    data['questions'] = questions;
    data['question_id'] = questionId;
    return data;
  }
}
