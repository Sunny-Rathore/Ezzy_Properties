class DealersWisePropertiesModel {
  int? status;
  String? message;
  List<Data>? data;

  DealersWisePropertiesModel({this.status, this.message, this.data});

  DealersWisePropertiesModel.fromJson(Map<String, dynamic> json) {
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
  String? favouriteStatus;
  String? dealerName;
  String? dealerAddress;
  String? dealerProfile;
  String? propertyId;
  String? projectId;
  String? propertyUniqueId;
  String? recommendedStatus;
  String? userId;
  String? cityId;
  String? stateId;
  String? propertyName;
  String? postedBy;
  String? address;
  String? postedFor;
  String? propertyKind;
  String? propertyTypeId;
  String? noOfBedrooms;
  String? noOfBathrooms;
  String? area;
  String? areaTypeId;
  String? propertyAge;
  String? furnishing;
  String? parking;
  String? haveReservedParking;
  String? floors;
  String? constructionStatus;
  String? price;
  String? description;
  List<Amenities>? amenities;
  String? thumbnailImage;
  String? files;
  String? status;
  String? ratingId;
  String? entrydt;
  String? imageUrl;
  String? defaultImage;
  String? interestCount;
  List<InterestedBuyers>? interestedBuyers;
  String? ratingCount;
  String? avgRating;
  List<Reviews>? reviews;
  String? ownerName;
  String? ownerMobile;
  String? propertType;
  List<String>? filesArray;

  Data(
      {this.favouriteStatus,
      this.dealerName,
      this.dealerAddress,
      this.dealerProfile,
      this.propertyId,
      this.projectId,
      this.propertyUniqueId,
      this.recommendedStatus,
      this.userId,
      this.cityId,
      this.stateId,
      this.propertyName,
      this.postedBy,
      this.address,
      this.postedFor,
      this.propertyKind,
      this.propertyTypeId,
      this.noOfBedrooms,
      this.noOfBathrooms,
      this.area,
      this.areaTypeId,
      this.propertyAge,
      this.furnishing,
      this.parking,
      this.haveReservedParking,
      this.floors,
      this.constructionStatus,
      this.price,
      this.description,
      this.amenities,
      this.thumbnailImage,
      this.files,
      this.status,
      this.ratingId,
      this.entrydt,
      this.imageUrl,
      this.defaultImage,
      this.interestCount,
      this.interestedBuyers,
      this.ratingCount,
      this.avgRating,
      this.reviews,
      this.ownerName,
      this.ownerMobile,
      this.propertType,
      this.filesArray});

  Data.fromJson(Map<String, dynamic> json) {
    favouriteStatus = json['favourite_status'];
    dealerName = json['dealer_name'];
    dealerAddress = json['dealer_address'];
    dealerProfile = json['dealer_profile'];
    propertyId = json['property_id'];
    projectId = json['project_id'];
    propertyUniqueId = json['property_unique_id'];
    recommendedStatus = json['recommended_status'];
    userId = json['user_id'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    propertyName = json['property_name'];
    postedBy = json['posted_by'];
    address = json['address'];
    postedFor = json['posted_for'];
    propertyKind = json['property_kind'];
    propertyTypeId = json['property_type_id'];
    noOfBedrooms = json['no_of_bedrooms'];
    noOfBathrooms = json['no_of_bathrooms'];
    area = json['area'];
    areaTypeId = json['area_type_id'];
    propertyAge = json['property_age'];
    furnishing = json['furnishing'];
    parking = json['parking'];
    haveReservedParking = json['have_reserved_parking'];
    floors = json['floors'];
    constructionStatus = json['construction_status'];
    price = json['price'];
    description = json['description'];
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(Amenities.fromJson(v));
      });
    }
    thumbnailImage = json['thumbnail_image'];
    files = json['files'];
    status = json['status'];
    ratingId = json['rating_id'];
    entrydt = json['entrydt'];
    imageUrl = json['image_url'];
    defaultImage = json['default_image'];
    interestCount = json['interest_count'];
    if (json['interested_buyers'] != null) {
      interestedBuyers = <InterestedBuyers>[];
      json['interested_buyers'].forEach((v) {
        interestedBuyers!.add(InterestedBuyers.fromJson(v));
      });
    }
    ratingCount = json['rating_count'];
    avgRating = json['avg_rating'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    ownerName = json['owner_name'];
    ownerMobile = json['owner_mobile'];
    propertType = json['propert_type'];
    filesArray = json['files_array'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favourite_status'] = favouriteStatus;
    data['dealer_name'] = dealerName;
    data['dealer_address'] = dealerAddress;
    data['dealer_profile'] = dealerProfile;
    data['property_id'] = propertyId;
    data['project_id'] = projectId;
    data['property_unique_id'] = propertyUniqueId;
    data['recommended_status'] = recommendedStatus;
    data['user_id'] = userId;
    data['city_id'] = cityId;
    data['state_id'] = stateId;
    data['property_name'] = propertyName;
    data['posted_by'] = postedBy;
    data['address'] = address;
    data['posted_for'] = postedFor;
    data['property_kind'] = propertyKind;
    data['property_type_id'] = propertyTypeId;
    data['no_of_bedrooms'] = noOfBedrooms;
    data['no_of_bathrooms'] = noOfBathrooms;
    data['area'] = area;
    data['area_type_id'] = areaTypeId;
    data['property_age'] = propertyAge;
    data['furnishing'] = furnishing;
    data['parking'] = parking;
    data['have_reserved_parking'] = haveReservedParking;
    data['floors'] = floors;
    data['construction_status'] = constructionStatus;
    data['price'] = price;
    data['description'] = description;
    if (amenities != null) {
      data['amenities'] = amenities!.map((v) => v.toJson()).toList();
    }
    data['thumbnail_image'] = thumbnailImage;
    data['files'] = files;
    data['status'] = status;
    data['rating_id'] = ratingId;
    data['entrydt'] = entrydt;
    data['image_url'] = imageUrl;
    data['default_image'] = defaultImage;
    data['interest_count'] = interestCount;
    if (interestedBuyers != null) {
      data['interested_buyers'] =
          interestedBuyers!.map((v) => v.toJson()).toList();
    }
    data['rating_count'] = ratingCount;
    data['avg_rating'] = avgRating;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['owner_name'] = ownerName;
    data['owner_mobile'] = ownerMobile;
    data['propert_type'] = propertType;
    data['files_array'] = filesArray;
    return data;
  }
}

class Amenities {
  String? name;
  String? icon;

  Amenities({this.name, this.icon});

  Amenities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}

class InterestedBuyers {
  int? interestId;
  int? userId;
  String? name;
  String? userImage;

  InterestedBuyers({this.interestId, this.userId, this.name, this.userImage});

  InterestedBuyers.fromJson(Map<String, dynamic> json) {
    interestId = json['interest_id'];
    userId = json['user_id'];
    name = json['name'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['interest_id'] = interestId;
    data['user_id'] = userId;
    data['name'] = name;
    data['user_image'] = userImage;
    return data;
  }
}

class Reviews {
  int? ratingId;
  int? userId;
  double? rating;
  String? review;
  String? name;
  String? userImage;

  Reviews(
      {this.ratingId,
      this.userId,
      this.rating,
      this.review,
      this.name,
      this.userImage});

  Reviews.fromJson(Map<String, dynamic> json) {
    ratingId = json['rating_id'];
    userId = json['user_id'];
    rating = json['rating'];
    review = json['review'];
    name = json['name'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating_id'] = ratingId;
    data['user_id'] = userId;
    data['rating'] = rating;
    data['review'] = review;
    data['name'] = name;
    data['user_image'] = userImage;
    return data;
  }
}
