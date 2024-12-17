import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base/styles/app_styles.dart';
import '../components/top_bar_component.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: TopBarComponent(
            title: "Send Money",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                  ],
                  decoration: InputDecoration(
                fillColor: AppStyles.white,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Amount",
              ))
            ],
          ),
        )
      ]),
    );
  }
}
