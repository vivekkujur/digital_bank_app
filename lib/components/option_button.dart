import 'package:digitalbankapp/view/send_money_screen.dart';
import 'package:digitalbankapp/view/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/constants.dart';
import '../base/styles/app_styles.dart';

class OptionButton extends StatefulWidget {
  const OptionButton(
      {super.key,
      required this.buttonName,
      required this.icons,
      required this.action});
  final String buttonName;
  final String icons;
  final ButtonAction action;

  @override
  State<OptionButton> createState() =>
      _OptionButtonState(buttonName, icons, action);
}

class _OptionButtonState extends State<OptionButton> {
  final String buttonName;
  final String icons;
  final ButtonAction action;

  _OptionButtonState(this.buttonName, this.icons, this.action);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (action) {
          case ButtonAction.sendMoney:
            {
              Get.to(const SendMoneyScreen());
            }
          case ButtonAction.transaction:
            {
              Get.to(const TransactionScreen());
            }
          default:
            {}
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        alignment: Alignment.center,
        width: 100,
        height: 120,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppStyles.gray3,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0, color: AppStyles.primaryColor),
              ),
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(icons))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                alignment: Alignment.center,
                child: Text(buttonName,
                    style: AppStyles.textStyleGreyH3.copyWith(fontSize: 14),
                    textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
