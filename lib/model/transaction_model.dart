class TransactionModel {
  int? status;
  String? message;
  List<Data>? data;

  TransactionModel({this.status, this.message, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? transactionId;
  String? userId;
  String? amount;
  String? status;
  String? entrydt;
  String? name;
  String? mobile;

  Data(
      {this.id,
      this.transactionId,
      this.userId,
      this.amount,
      this.status,
      this.entrydt,
      this.name,
      this.mobile});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    userId = json['user_id'];
    amount = json['amount'];
    status = json['status'];
    entrydt = json['entrydt'];
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_id'] = transactionId;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['status'] = status;
    data['entrydt'] = entrydt;
    data['name'] = name;
    data['mobile'] = mobile;
    return data;
  }
}
