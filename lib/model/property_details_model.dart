class PropertyDetailsModel {
  int? status;
  String? message;
  List<Data>? data;

  PropertyDetailsModel({this.status, this.message, this.data});

  PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? propertyId;
  String? propertyName;
  String? propertyAddress;
  String? propertyPrice;
  String? propertyImage;
  String? noOfBedrooms;
  String? noOfBathrooms;
  String? area;
  String? areaType;
  String? parking;
  String? description;
  String? rating;
  String? ownerName;
  String? ownerMoible;
  String? posted;

  Data(
      {this.propertyId,
      this.propertyName,
      this.propertyAddress,
      this.propertyPrice,
      this.propertyImage,
      this.noOfBedrooms,
      this.noOfBathrooms,
      this.area,
      this.areaType,
      this.parking,
      this.description,
      this.rating,
      this.ownerName,
      this.ownerMoible,
      this.posted});

  Data.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    propertyName = json['property_name'];
    propertyAddress = json['property_address'];
    propertyPrice = json['property_price'];
    propertyImage = json['property_image'];
    noOfBedrooms = json['no_of_bedrooms'];
    noOfBathrooms = json['no_of_bathrooms'];
    area = json['area'];
    areaType = json['area_type'];
    parking = json['parking'];
    description = json['description'];
    rating = json['rating'];
    ownerName = json['Owner_Name'];
    ownerMoible = json['Owner_Moible'];
    posted = json['posted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_id'] = propertyId;
    data['property_name'] = propertyName;
    data['property_address'] = propertyAddress;
    data['property_price'] = propertyPrice;
    data['property_image'] = propertyImage;
    data['no_of_bedrooms'] = noOfBedrooms;
    data['no_of_bathrooms'] = noOfBathrooms;
    data['area'] = area;
    data['area_type'] = areaType;
    data['parking'] = parking;
    data['description'] = description;
    data['rating'] = rating;
    data['Owner_Name'] = ownerName;
    data['Owner_Moible'] = ownerMoible;
    data['posted'] = posted;
    return data;
  }
}
