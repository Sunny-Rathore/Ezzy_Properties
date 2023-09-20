class GetSubscriptionModel {
  int? status;
  String? message;
  List<Data>? data;

  GetSubscriptionModel({this.status, this.message, this.data});

  GetSubscriptionModel.fromJson(Map<String, dynamic> json) {
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
  String? subscriptionId;
  String? userId;
  String? planId;
  String? planName;
  String? planAmount;
  String? freePosts;
  String? freeProfileViews;
  String? activationDate;
  String? expiryDate;
  String? entrydt;
  int? isActive;
  String? timeAgo;

  Data(
      {this.subscriptionId,
      this.userId,
      this.planId,
      this.planName,
      this.planAmount,
      this.freePosts,
      this.freeProfileViews,
      this.activationDate,
      this.expiryDate,
      this.entrydt,
      this.isActive,
      this.timeAgo});

  Data.fromJson(Map<String, dynamic> json) {
    subscriptionId = json['subscription_id'];
    userId = json['user_id'];
    planId = json['plan_id'];
    planName = json['plan_name'];
    planAmount = json['plan_amount'];
    freePosts = json['free_posts'];
    freeProfileViews = json['free_profile_views'];
    activationDate = json['activation_date'];
    expiryDate = json['expiry_date'];
    entrydt = json['entrydt'];
    isActive = json['isActive'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscription_id'] = subscriptionId;
    data['user_id'] = userId;
    data['plan_id'] = planId;
    data['plan_name'] = planName;
    data['plan_amount'] = planAmount;
    data['free_posts'] = freePosts;
    data['free_profile_views'] = freeProfileViews;
    data['activation_date'] = activationDate;
    data['expiry_date'] = expiryDate;
    data['entrydt'] = entrydt;
    data['isActive'] = isActive;
    data['time_ago'] = timeAgo;
    return data;
  }
}
