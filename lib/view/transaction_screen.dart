import 'package:digitalbankapp/controller/homeController.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/styles/app_styles.dart';
import '../components/top_bar_component.dart';
import '../components/transaction_list.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TopBarComponent(
                title: "Transactions",
              ),
            ),
            Expanded(flex:1,child: TransactionList())
          ],
        ),
      ),
    );;
  }
}
