import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/styles/app_styles.dart';
import '../view/home_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.btnName,});
  final String btnName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Get.to(HomeScreen());
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
