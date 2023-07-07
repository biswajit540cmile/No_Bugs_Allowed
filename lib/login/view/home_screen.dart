import 'package:flutter/material.dart';
import 'package:nba_code/transaction/view/transaction_screen.dart';

import '../../constants/string_constants.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: StringConstant.boolFalse,
        title: const Text(StringConstant.textLogin),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 0,
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => const TransactionScreen(),));
        },
      ),
    );
  }
}
