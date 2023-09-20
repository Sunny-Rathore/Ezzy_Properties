class AllBuyersModel {
  int? status;
  String? message;
  List<Data>? data;

  AllBuyersModel({this.status, this.message, this.data});

  AllBuyersModel.fromJson(Map<String, dynamic> json) {
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
  String? buyerId;
  String? buyerName;
  String? buyerMobile;
  String? buyerProfile;
  String? timezone;

  Data(
      {this.buyerId,
      this.buyerName,
      this.buyerMobile,
      this.buyerProfile,
      this.timezone});

  Data.fromJson(Map<String, dynamic> json) {
    buyerId = json['buyer_id'];
    buyerName = json['buyer_name'];
    buyerMobile = json['buyer_mobile'];
    buyerProfile = json['buyer_profile'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['buyer_id'] = buyerId;
    data['buyer_name'] = buyerName;
    data['buyer_mobile'] = buyerMobile;
    data['buyer_profile'] = buyerProfile;
    data['timezone'] = timezone;
    return data;
  }
}
