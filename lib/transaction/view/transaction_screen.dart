import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../constants/number_constants.dart';
import '../../constants/string_constants.dart';
import '../../constants/style_constants.dart';
import '../controller/transaction_screen_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionScreenController>();
    controller.getUserTransactionList();
    return Scaffold(
      body: Consumer<TransactionScreenController>(
          builder: (context, contactsModel, child) {

        final transactionList = contactsModel.transactionList;
       // print("${contactsModel.transactionList[2].amount}");
        return ListView.builder(
          itemCount: transactionList.length,
          itemBuilder: (context, index) {
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
                          "${transactionList[index].creationDateTime}",
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
                            Text("${transactionList[index].amount}",
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
                            Text("${transactionList[index].amount}",
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
                          child: Text("${transactionList[index].note}",
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
