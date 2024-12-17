import 'package:digitalbankapp/controller/homeController.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../base/styles/app_styles.dart';
import '../base/styles/media.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: AppStyles.offwhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0, color: AppStyles.primaryColor)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(3),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AddMedia.splash,
                      colorFilter: ColorFilter.mode(
                          AppStyles.primaryColor, BlendMode.srcIn),
                    ),
                    decoration: BoxDecoration(
                        color: AppStyles.secondary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 0, color: AppStyles.primaryColor)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(3),
                        alignment: Alignment.centerLeft,
                        child: Obx(() => Text(
                            "₱ ${controller.showBalance.value == true ? controller.balance : "****"}",
                            style: AppStyles.priceTextStyle,
                            textAlign: TextAlign.left))),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        controller.showBalance.value =
                            !controller.showBalance.value;
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        child: Icon(
                          controller.showBalance.value == true
                              ? FluentSystemIcons.ic_fluent_eye_show_regular
                              : FluentSystemIcons.ic_fluent_eye_hide_regular,
                          size: 30,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text("Wallet Balance",
                    style: AppStyles.textStyleGreyH3,
                    textAlign: TextAlign.left)),
          ],
        ),
      ),
    );
  }
}
