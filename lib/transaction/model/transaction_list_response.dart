// class TransactionListResponse {
//   String? status;
//   int? statusCode;
//   String? message;
//   List<Transaction>? data;
//
//   TransactionListResponse(
//       {this.status, this.statusCode, this.message, this.data});
//
//   TransactionListResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     statusCode = json['statusCode'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Transaction>[];
//       json['data'].forEach((v) {
//         data!.add(Transaction.fromJson(v));
//       });
//     }
//
//     Map<String, dynamic> toJson() {
//       final Map<String, dynamic> data = new Map<String, dynamic>();
//       data['status'] = this.status;
//       data['statusCode'] = this.statusCode;
//       data['message'] = this.message;
//       if (this.data != null) {
//         data['data'] = this.data!.map((v) => v.toJson()).toList();
//       }
//       return data;
//     }
//   }
// }
//
// class Transaction {
//   int? transactionId;
//   String? id;
//   int? amount;
//   String? note;
//   String? creationDateTime;
//   String? mode;
//
//   Transaction(
//       {this.transactionId,
//         this.id,
//         this.amount,
//         this.note,
//         this.creationDateTime,
//         this.mode});
//
//   Transaction.fromJson(Map<String, dynamic> json) {
//     transactionId = json['transsactionId'];
//     id = json['id'];
//     amount = json['amount'];
//     note = json['note'];
//     creationDateTime = json['creationDateTime'];
//     mode = json['mode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['transsactionId'] = this.transactionId;
//     data['id'] = this.id;
//     data['amount'] = this.amount;
//     data['note'] = this.note;
//     data['creationDateTime'] = this.creationDateTime;
//     data['mode'] = this.mode;
//     return data;
//   }
// }






















//
// class Transaction {
//   int? transactionId;
//   String? id;
//   int? amount;
//   String? note;
//   String? creationDateTime;
//   String? mode;
//
//   Transaction({
//     this.transactionId,
//     this.id,
//     this.amount,
//     this.note,
//     this.creationDateTime,
//     this.mode,
//   });
//
//   TransactionBuilder toBuilder() {
//     return TransactionBuilder()
//       ..transactionId = transactionId
//       ..id = id
//       ..amount = amount
//       ..note = note
//       ..creationDateTime = creationDateTime
//       ..mode = mode;
//   }
//
//   Transaction.fromJson(Map<String, dynamic> json) {
//     transactionId = json['transsactionId'];
//     id = json['id'];
//     amount = json['amount'];
//     note = json['note'];
//     creationDateTime = json['creationDateTime'];
//     mode = json['mode'];
//   }
// }
//
// class TransactionBuilder {
//   int? transactionId;
//   String? id;
//   int? amount;
//   String? note;
//   String? creationDateTime;
//   String? mode;
//
//   Transaction build() {
//     return Transaction(
//       transactionId: transactionId,
//       id: id,
//       amount: amount,
//       note: note,
//       creationDateTime: creationDateTime,
//       mode: mode,
//     );
//   }
// }
//
// class TransactionListResponse {
//   String? status;
//   int? statusCode;
//   String? message;
//   List<Transaction>? data;
//
//   TransactionListResponse({
//     this.status,
//     this.statusCode,
//     this.message,
//     this.data,
//   });
//
//
//   TransactionListResponseBuilder toBuilder() {
//     return TransactionListResponseBuilder()
//       ..status = status
//       ..statusCode = statusCode
//       ..message = message
//       ..data = data?.map((transaction) => transaction.toBuilder().build()).toList();
//
//   }
//
//   TransactionListResponse.fromJson(json) {
//     status = json['status'];
//     statusCode = json['statusCode'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Transaction>[];
//       json['data'].forEach((v) {
//         data!.add(Transaction.fromJson(v));
//       });
//     }
// }
// }
//
// class TransactionListResponseBuilder {
//   String? status;
//   int? statusCode;
//   String? message;
//   List<Transaction>? data;
//
//   TransactionListResponse build() {
//     return TransactionListResponse(
//       status: status,
//       statusCode: statusCode,
//       message: message,
//       data: data,
//     );
//   }


//}




















class TransactionListResponse {
  String? status;
  int? statusCode;
  String? message;
  List<Transaction>? data;

  TransactionListResponse._(
      {this.status, this.statusCode, this.message, this.data});

  factory TransactionListResponse.build(builder) {
    final responseBuilder = builder(ResponseBuilder());

    return TransactionListResponse._(
      status: responseBuilder.status,
      statusCode: responseBuilder.statusCode,
      message: responseBuilder.message,
      data: responseBuilder.data,
    );
  }
}

class ResponseBuilder {
  String? status;
  int? statusCode;
  String? message;
  List<Transaction>? data;

  ResponseBuilder withStatus(String? status) {
    this.status = status;
    return this;
  }

  ResponseBuilder withStatusCode(int? statusCode) {
    this.statusCode = statusCode;
    return this;
  }

  ResponseBuilder withMessage(String? message) {
    this.message = message;
    return this;
  }

  ResponseBuilder withData(List<Transaction>? data) {
    this.data = data;
    return this;
  }
}

class Transaction {
  int? transactionId;
  String? id;
  int? amount;
  String? note;
  String? creationDateTime;
  String? mode;

  Transaction._({
    this.transactionId,
    this.id,
    this.amount,
    this.note,
    this.creationDateTime,
    this.mode,
  });

  factory Transaction.build( builder) {
    final transactionBuilder = builder(TransactionBuilder());

    return Transaction._(
      transactionId: transactionBuilder.transactionId,
      id: transactionBuilder.id,
      amount: transactionBuilder.amount,
      note: transactionBuilder.note,
      creationDateTime: transactionBuilder.creationDateTime,
      mode: transactionBuilder.mode,
    );
  }
}

class TransactionBuilder {
  int? transactionId;
  String? id;
  int? amount;
  String? note;
  String? creationDateTime;
  String? mode;

  TransactionBuilder withTransactionId(int? transactionId) {
    this.transactionId = transactionId;
    return this;
  }

  TransactionBuilder withId(String? id) {
    this.id = id;
    return this;
  }

  TransactionBuilder withAmount(int? amount) {
    this.amount = amount;
    return this;
  }

  TransactionBuilder withNote(String? note) {
    this.note = note;
    return this;
  }

  TransactionBuilder withCreationDateTime(String? creationDateTime) {
    this.creationDateTime = creationDateTime;
    return this;
  }

  TransactionBuilder withMode(String? mode) {
    this.mode = mode;
    return this;
  }
}
