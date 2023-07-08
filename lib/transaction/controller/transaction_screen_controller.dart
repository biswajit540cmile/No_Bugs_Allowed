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
   late dynamic jsonData =[];

   Future<void> getUserTransactionList() async {
   const url = ApiConstants.userTransactions; // Replace with your API URL

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await readJson().then((value) {
         jsonData = json.decode(value);//convert json to object
          //print(int.parse(jsonData["data"].forEach(v){}));
          // final v1 = (jsonData["data"] );
          //  defaultGroupResponse = TransactionListResponse.build((responseBuilder) => responseBuilder
          //     .withStatus(jsonData['status'])
          //     .withStatusCode(jsonData['statusCode'])
          //     .withMessage(jsonData['message'])
          //     .withData(transactionList));
         //  print(jsonData["data"][1]);
         // transactionList["data"][index]["id"]
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


