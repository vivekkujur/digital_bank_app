import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import '../base/styles/app_styles.dart';

class TopBarComponent extends StatelessWidget {
  const TopBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: const Icon(FluentSystemIcons.ic_fluent_person_regular),
          decoration: BoxDecoration(
              color: Color(0x1a2cf19e),
              borderRadius: BorderRadius.circular(50),
              border:
              Border.all(width: 0, color: AppStyles.primaryColor)),
        ),
        Container(
          height: 40,
          width: 50,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          child: const Icon(FluentSystemIcons.ic_fluent_chat_filled),
        ),
      ],

    );
  }
}
