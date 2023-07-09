import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


import '../../constants/api_constants.dart';
import '../../constants/number_constants.dart';
import '../../constants/string_constants.dart';
import '../model/transaction_list_response.dart';

class TransactionScreenController extends ChangeNotifier {
  TransactionListResponse? defaultGroupResponse;
  List<Transaction> transactionList = [];
   Future<void> getUserTransactionList() async {
   const url = ApiConstants.userTransactions; // Replace with your API URL
    try {
      transactionList =[];
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await readJson().then((value) {
        var jsonData = json.decode(value);//convert json to object
        ///Using Builder Design Pattern to create Object of transactionListResponse
          for(var i=0;i<jsonData["data"].length;i++){
            var transactionListResponse = TransactionListResponse.build((responseBuilder) => responseBuilder
                .withStatus("okk")
                .withStatusCode(200)
                .withMessage('Transactions retrieved successfully')
                .withData([
              Transaction.build((transactionBuilder) => transactionBuilder
                  .withTransactionId(jsonData["data"][i]["transactionId"])
                  .withId(jsonData["data"][i]["id"])
                  .withAmount(jsonData["data"][i]["amount"])
                  .withNote(jsonData["data"][i]["note"])
                  .withCreationDateTime(jsonData["data"][i]["creationDateTime"])
                  .withMode(jsonData["data"][i]["mode"]))
            ]));
            transactionList.addAll(transactionListResponse.data as Iterable<Transaction>);
          }
        });
        notifyListeners();
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }


  ///Read convert json file to string
  Future<dynamic> readJson() async {
    var response =
        await rootBundle.loadString(StringConstant.jsonTransactionList);
    await Future.delayed(const Duration(seconds: NumberConstant.intOne));
    return response;
  }
}


