import 'package:digitalbankapp/base/constants.dart';
import 'package:digitalbankapp/controller/login_controller.dart';
import 'package:digitalbankapp/controller/send_money_controller.dart';
import 'package:digitalbankapp/view/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/styles/app_styles.dart';
import '../view/home_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.btnName,
    required this.action,
  });
  final String btnName;
  final ButtonAction action;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final SendMoneyController moneyController = Get.put(SendMoneyController());

    return InkWell(
      onTap: () async {
        switch (action) {
          case ButtonAction.home:
            {
              Get.to(const HomeScreen());
            }
          case ButtonAction.goBack:
            {
              Get.back();
            }
          case ButtonAction.signOut:
            {
              loginController.signOut();
            }
          case ButtonAction.sendMoneySubmit:
            {
              moneyController.sendMoneyAction(context);

            }
          case ButtonAction.transaction:
            {
              Get.to(TransactionScreen());
            }
          case ButtonAction.login:
            {
              loginController.getLoginApi();
            }
          default:
            {
              Get.to(HomeScreen());
            }
        }
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        alignment: Alignment.center,
        child: Text(
          btnName,
          style: TextStyle(
              color: AppStyles.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStyles.secondary),
      ),
    );
  }
}
