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
    const url = ApiConstants.userTransactions; // Replace with your API endpoint
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == NumberConstant.intTwoHundred) {
        await readJson().then((value) {
          defaultGroupResponse =
              TransactionListResponse.fromJson(jsonDecode(value.toString()));
          transactionList = defaultGroupResponse?.data ?? [];
          notifyListeners();
        });
      } else {
        ///Error Response
      }
    } catch (error) {
      print(error);
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
