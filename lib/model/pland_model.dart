class PlansModel {
  int? status;
  String? message;
  List<Data>? data;

  PlansModel({this.status, this.message, this.data});

  PlansModel.fromJson(Map<String, dynamic> json) {
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
  String? planId;
  String? name;
  String? price;
  String? validity;
  String? validityUnit;
  String? freePosts;
  String? freeProfileViews;
  String? description;
  String? status;
  String? entrydt;

  Data(
      {this.planId,
      this.name,
      this.price,
      this.validity,
      this.validityUnit,
      this.freePosts,
      this.freeProfileViews,
      this.description,
      this.status,
      this.entrydt});

  Data.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    name = json['name'];
    price = json['price'];
    validity = json['validity'];
    validityUnit = json['validity_unit'];
    freePosts = json['free_posts'];
    freeProfileViews = json['free_profile_views'];
    description = json['description'];
    status = json['status'];
    entrydt = json['entrydt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan_id'] = planId;
    data['name'] = name;
    data['price'] = price;
    data['validity'] = validity;
    data['validity_unit'] = validityUnit;
    data['free_posts'] = freePosts;
    data['free_profile_views'] = freeProfileViews;
    data['description'] = description;
    data['status'] = status;
    data['entrydt'] = entrydt;
    return data;
  }
}
