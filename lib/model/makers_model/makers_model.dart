class MakersModel {
  int? status;
  String? message;
  List<Data>? data;

  MakersModel({this.status, this.message, this.data});

  MakersModel.fromJson(Map<String, dynamic> json) {
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
  String? profile;
  String? username;
  String? rating;
  String? price;
  String? description;
  List<String>? workImages;
  List<Reviews>? reviews;

  Data(
      {this.userId,
      this.profile,
      this.username,
      this.rating,
      this.price,
      this.description,
      this.workImages,
      this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profile = json['profile'];
    username = json['username'];
    rating = json['rating'];
    price = json['price'];
    description = json['description'];
    workImages = json['work_images'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['profile'] = profile;
    data['username'] = username;
    data['rating'] = rating;
    data['price'] = price;
    data['description'] = description;
    data['work_images'] = workImages;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? reviews;
  String? comments;
  String? reviewerProfile;

  Reviews({this.reviews, this.comments, this.reviewerProfile});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviews = json['reviews'];
    comments = json['comments'];
    reviewerProfile = json['reviewer_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reviews'] = reviews;
    data['comments'] = comments;
    data['reviewer_profile'] = reviewerProfile;
    return data;
  }
}
