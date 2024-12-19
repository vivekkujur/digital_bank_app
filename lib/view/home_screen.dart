import 'package:digitalbankapp/base/styles/app_styles.dart';
import 'package:digitalbankapp/components/transaction_list.dart';
import 'package:digitalbankapp/controller/homeController.dart';
import 'package:digitalbankapp/view/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/options_component.dart';
import '../components/top_bar_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final controller  = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: TopBarComponent(title: "Maya Wallet",backEnable: false,),
          ),
          const WalletScreen(),
          const OptionsComponent(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),

        ],
      ),
    );
  }
}
