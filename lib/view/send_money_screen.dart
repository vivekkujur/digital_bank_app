import 'package:digitalbankapp/components/success_bottomsheet.dart';
import 'package:digitalbankapp/controller/send_money_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../base/constants.dart';
import '../base/styles/app_styles.dart';
import '../components/login_button.dart';
import '../components/top_bar_component.dart';
import 'home_screen.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}




class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final SendMoneyController controller = Get.put(SendMoneyController());

  @override
  void initState() {
    super.initState();
    controller.amountTextController.clear();
    controller.numberTextController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TopBarComponent(
                      title: "Send Money",
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Mobile number to send money",
                            textAlign: TextAlign.end,
                          ),
                        ),
                        TextField(
                            controller: controller.numberTextController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[\d.]')),
                            ],
                            decoration: InputDecoration(
                              fillColor: AppStyles.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Enter mobile number ",
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Amount",
                            textAlign: TextAlign.end,
                          ),
                        ),
                        TextField(
                            controller: controller.amountTextController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[\d.]')),
                            ],
                            decoration: InputDecoration(
                              fillColor: AppStyles.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Enter Amount",
                            ))
                      ],
                    ),
                  ),
                ]),
              ),
              LoginButton(
                btnName: "Submit",
                action: ButtonAction.sendMoneySubmit,
              ),
            ],
          ),
          Obx(() => controller.showProgress.value == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppStyles.secondary,
                    backgroundColor: AppStyles.primaryColor,
                  ),
                )
              : Container()),
        ],
      ),
    );
  }
}
