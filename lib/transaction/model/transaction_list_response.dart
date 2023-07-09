///builder pattern model
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
