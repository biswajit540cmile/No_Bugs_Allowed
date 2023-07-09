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
        title: const Center(child: Text("click on Floating Action button")),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => const TransactionScreen(),));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
