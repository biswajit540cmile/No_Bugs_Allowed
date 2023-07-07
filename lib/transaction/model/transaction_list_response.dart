class TransactionListResponse {
  String? status;
  int? statusCode;
  String? message;
  List<Transaction>? data;

  TransactionListResponse(
      {this.status, this.statusCode, this.message, this.data});

  TransactionListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Transaction>[];
      json['data'].forEach((v) {
        data!.add(Transaction.fromJson(v));
      });
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['status'] = this.status;
      data['statusCode'] = this.statusCode;
      data['message'] = this.message;
      if (this.data != null) {
        data['data'] = this.data!.map((v) => v.toJson()).toList();
      }
      return data;
    }
  }
}

class Transaction {
  int? transactionId;
  String? id;
  int? amount;
  String? note;
  String? creationDateTime;
  String? mode;

  Transaction(
      {this.transactionId,
        this.id,
        this.amount,
        this.note,
        this.creationDateTime,
        this.mode});

  Transaction.fromJson(Map<String, dynamic> json) {
    transactionId = json['transsactionId'];
    id = json['id'];
    amount = json['amount'];
    note = json['note'];
    creationDateTime = json['creationDateTime'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transsactionId'] = this.transactionId;
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['note'] = this.note;
    data['creationDateTime'] = this.creationDateTime;
    data['mode'] = this.mode;
    return data;
  }
}
