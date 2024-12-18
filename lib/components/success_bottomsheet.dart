import 'package:digitalbankapp/base/styles/app_styles.dart';
import 'package:digitalbankapp/view/home_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/constants.dart';
import '../base/styles/media.dart';
import 'login_button.dart';

class SuccessBottomsheet extends StatelessWidget {
  const SuccessBottomsheet({super.key});

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
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AddMedia.success))),
            ),
            Text(
              'Successful sent',
              style: AppStyles.headerTextStyle1
                  .copyWith(color: AppStyles.primaryColor),
            ),
            Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: AppStyles.offwhite,
                  border: Border.all(color: AppStyles.primaryColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(FluentSystemIcons.ic_fluent_person_filled),
                    title: Text("7366848484"),
                    trailing: Text("100000.00"),
                  ),
                  ListTile(
                    title: Text("Date"),
                    trailing: Text("12-12-2024"),
                  )
                ],
              ),
            ),
            LoginButton(
              btnName: "Home",
              action: ButtonAction.home,
            ),
          ],
        ),
      ),
    );
  }
}
