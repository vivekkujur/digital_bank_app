import 'package:digitalbankapp/components/logout_bottomsheet.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/styles/app_styles.dart';

class TopBarComponent extends StatelessWidget {
  const TopBarComponent({super.key, required this.title,  this.backEnable = true});
final String title;
  final bool backEnable;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backEnable?
      InkWell(
        onTap: (){
          Get.back();
        },
        child: Container(
          padding: EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: const Icon(FluentSystemIcons.ic_fluent_arrow_left_filled),

            ),
      )

        :
        InkWell(
          onTap: (){

            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return  LogoutBottomsheet();
                });
          },
          child: Container(
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
        ),
        Expanded(
          flex:1,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Text(title,
                  style: AppStyles.headerTextStyle1.copyWith(color: AppStyles.secondary),
                  textAlign: TextAlign.left)),
        ),
        Container(
          height: 40,
          width: 50,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          child: const Icon(FluentSystemIcons.ic_fluent_alert_filled),
        ),
      ],

    );
  }
}
