import 'package:flutter/material.dart';
import 'package:nba_code/transaction/controller/transaction_screen_controller.dart';
import 'package:provider/provider.dart';

import 'constants/color_constants.dart';
import 'constants/string_constants.dart';
import 'login/view/home_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TransactionScreenController>(
            create: (context) => TransactionScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: StringConstant.boolFalse,
       // initialRoute: routes.splash,
        theme: ThemeData(
          fontFamily: StringConstant.textFontPoppins,
          useMaterial3: StringConstant.boolTrue,
          primarySwatch: blueColor,
        ),
        home:  const HomeScreen(),
      ),
    );
  }
}
