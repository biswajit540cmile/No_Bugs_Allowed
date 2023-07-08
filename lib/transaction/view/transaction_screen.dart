import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../constants/number_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/style_constants.dart';
import '../controller/transaction_screen_controller.dart';
import '../model/transaction_list_response.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    var list =[];
    final controller = context.read<TransactionScreenController>();
    controller.getUserTransactionList();
    return Scaffold(
      body: Consumer<TransactionScreenController>(
          builder: (context, contactsModel, child) {
        var transactionList = contactsModel.jsonData;
       // print("${contactsModel.transactionList[2].amount}");
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            var transactionListResponse = TransactionListResponse.build((responseBuilder) => responseBuilder
                .withStatus("okk")
                .withStatusCode(200)
                .withMessage('Transactions retrieved successfully')
                .withData([
              Transaction.build((transactionBuilder) => transactionBuilder
                  .withTransactionId(transactionList["data"][index]["transactionId"])
                  .withId(transactionList["data"][index]["id"])
                  .withAmount(transactionList["data"][index]["amount"])
                  .withNote(transactionList["data"][index]["note"])
                  .withCreationDateTime('2023-07-09')
                  .withMode(transactionList["data"][index]["mode"]))
            ]));

            return Container(
              margin: const EdgeInsets.only(top: NumberConstant.doubleFour),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(NumberConstant.doubleTwenty)),
                  color: cardBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.all(NumberConstant.doubleSixteen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringConstant.textDate,
                            style: AppStyle.listTitleTextStyle()),
                        Text(
                          "${transactionListResponse.data?[index]?.creationDateTime ?? ""}",
                          style: AppStyle.listDataTextStyle(),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstant.textPaidAmount,
                          style: AppStyle.listTitleTextStyle(),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee_outlined,
                                size: NumberConstant.doubleFourteen),
                            Text("${transactionListResponse.data?[index]?.amount ?? ""}",
                                style: AppStyle.listDataTextStyle()),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstant.textDueAmount,
                          style: AppStyle.listTitleTextStyle(),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee_outlined,
                                size: NumberConstant.doubleFourteen),
                            Text("${transactionListResponse.data?[index]?.amount ?? ""}",
                                style: AppStyle.listDataTextStyle()),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstant.textNote,
                          style: AppStyle.listTitleTextStyle(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: NumberConstant.doubleEight),
                          child: Text("${transactionListResponse.data?[index]?.note ?? ""}",
                              style: AppStyle.listDataTextStyle()),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
