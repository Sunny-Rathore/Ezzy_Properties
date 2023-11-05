class RecommendedProjectsModel {
  int? status;
  String? message;
  List<Data>? data;

  RecommendedProjectsModel({this.status, this.message, this.data});

  RecommendedProjectsModel.fromJson(Map<String, dynamic> json) {
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
  String? projectId;
  String? uniqueId;
  String? projectName;
  String? address;
  String? thumbnailImage;
  String? recommendedStatus;
  String? isActive;
  String? entrydt;

  Data(
      {this.projectId,
      this.uniqueId,
      this.projectName,
      this.address,
      this.thumbnailImage,
      this.recommendedStatus,
      this.isActive,
      this.entrydt});

  Data.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    uniqueId = json['unique_id'];
    projectName = json['project_name'];
    address = json['address'];
    thumbnailImage = json['thumbnail_image'];
    recommendedStatus = json['recommended_status'];
    isActive = json['is_active'];
    entrydt = json['entrydt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['unique_id'] = uniqueId;
    data['project_name'] = projectName;
    data['address'] = address;
    data['thumbnail_image'] = thumbnailImage;
    data['recommended_status'] = recommendedStatus;
    data['is_active'] = isActive;
    data['entrydt'] = entrydt;
    return data;
  }
}
