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

  // Future<void> getUserTransactionList() async {
  //   const url = ApiConstants.userTransactions; // Replace with your API endpoint
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == NumberConstant.intTwoHundred) {
  //       await readJson().then((value) {
  //         defaultGroupResponse =
  //             TransactionListResponse.fromJson(jsonDecode(value.toString()));
  //         transactionList = defaultGroupResponse?.data ?? [];
  //         notifyListeners();
  //       });
  //     } else {
  //       ///Error Response
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

   Future<void> getUserTransactionList() async {
   final url = 'https://your-api-url.com/transactions'; // Replace with your API URL

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await readJson().then((value) {
        final jsonData = json.decode(value);
        if (jsonData['data'] != null) {
          final transactions = jsonData['data'] as List<dynamic>;
          // var data1 = transactions.map((transaction) {
          //   return TransactionListResponseBuilder()..data..build();
          // }).toList();
         // print(transactions);
          var data1 = transactions.map((transaction) {
             return TransactionBuilder()..id;
          }).toList();
        print(data1[1].id);
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


