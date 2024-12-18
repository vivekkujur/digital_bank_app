import 'package:digitalbankapp/base/constants.dart';
import 'package:digitalbankapp/components/success_bottomsheet.dart';
import 'package:digitalbankapp/view/send_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/styles/app_styles.dart';
import '../view/home_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.btnName, required this.action,});
  final String btnName;
  final ButtonAction action;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){

        switch(action){
          case ButtonAction.home :{
            Get.to(const HomeScreen());

          }
          case ButtonAction.sendMoneySubmit :{
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return const SuccessBottomsheet();
              });

          }
          case ButtonAction.login :{
            Get.to(HomeScreen());

          }
          default:{
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
              color: AppStyles.primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStyles.secondary),
      ),
    );
  }
}
