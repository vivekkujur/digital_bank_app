import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/constants.dart';
import '../base/styles/app_styles.dart';
import '../base/styles/media.dart';
import 'login_button.dart';

class LogoutBottomsheet extends StatelessWidget {
  const LogoutBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: Get.height*0.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(

              child: Icon(FluentSystemIcons.ic_fluent_person_filled,size: 100,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Maya",
                style: AppStyles.headerTextStyle1
                    .copyWith(color: AppStyles.secondary,fontSize: 16),
              ),
            ),
            LoginButton(
              btnName: "Sign Out",
              action: ButtonAction.signOut,
            ),
          ],
        ),
      ),
    );
  }
}
