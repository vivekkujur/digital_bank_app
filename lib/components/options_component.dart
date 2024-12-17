import 'package:digitalbankapp/components/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base/styles/app_styles.dart';
import '../base/styles/media.dart';

class OptionsComponent extends StatefulWidget {
  const OptionsComponent({super.key});

  @override
  State<OptionsComponent> createState() => _OptionsComponentState();
}

class _OptionsComponentState extends State<OptionsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: const Row(
        children: [

          OptionButton(buttonName: "Send\nmoney",icons: AddMedia.sendMoney,),
          OptionButton(buttonName: "Transactions\n",icons: AddMedia.transaction)


        ],
      ),
    );
  }
}
