class PostPropertyModel {
  int? status;
  String? message;
  dynamic data;

  PostPropertyModel({this.status, this.message, this.data});

  PostPropertyModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? postedBy;
  String? propertyName;
  String? cityId;
  String? postedFor;
  String? stateId;
  String? noOfBedrooms;
  String? noOfBathrooms;
  String? area;
  String? areaTypeId;
  String? propertyAge;
  String? furnishing;
  String? haveReservedParking;
  String? floors;
  String? constructionStatus;
  String? price;
  String? description;
  String? propertyTypeId;
  String? propertyKind;
  String? parking;
  String? status;
  String? thumbnailImage;
  int? propertyId;

  Data(
      {this.userId,
      this.postedBy,
      this.propertyName,
      this.cityId,
      this.postedFor,
      this.stateId,
      this.noOfBedrooms,
      this.noOfBathrooms,
      this.area,
      this.areaTypeId,
      this.propertyAge,
      this.furnishing,
      this.haveReservedParking,
      this.floors,
      this.constructionStatus,
      this.price,
      this.description,
      this.propertyTypeId,
      this.propertyKind,
      this.parking,
      this.status,
      this.thumbnailImage,
      this.propertyId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    postedBy = json['posted_by'];
    propertyName = json['property_name'];
    cityId = json['city_id'];
    postedFor = json['posted_for'];
    stateId = json['state_id'];
    noOfBedrooms = json['no_of_bedrooms'];
    noOfBathrooms = json['no_of_bathrooms'];
    area = json['area'];
    areaTypeId = json['area_type_id'];
    propertyAge = json['property_age'];
    furnishing = json['furnishing'];
    haveReservedParking = json['have_reserved_parking'];
    floors = json['floors'];
    constructionStatus = json['construction_status'];
    price = json['price'];
    description = json['description'];
    propertyTypeId = json['property_type_id'];
    propertyKind = json['property_kind'];
    parking = json['parking'];
    status = json['status'];
    thumbnailImage = json['thumbnail_image'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['posted_by'] = postedBy;
    data['property_name'] = propertyName;
    data['city_id'] = cityId;
    data['posted_for'] = postedFor;
    data['state_id'] = stateId;
    data['no_of_bedrooms'] = noOfBedrooms;
    data['no_of_bathrooms'] = noOfBathrooms;
    data['area'] = area;
    data['area_type_id'] = areaTypeId;
    data['property_age'] = propertyAge;
    data['furnishing'] = furnishing;
    data['have_reserved_parking'] = haveReservedParking;
    data['floors'] = floors;
    data['construction_status'] = constructionStatus;
    data['price'] = price;
    data['description'] = description;
    data['property_type_id'] = propertyTypeId;
    data['property_kind'] = propertyKind;
    data['parking'] = parking;
    data['status'] = status;
    data['thumbnail_image'] = thumbnailImage;
    data['property_id'] = propertyId;
    return data;
  }
}
