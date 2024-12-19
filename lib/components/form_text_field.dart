import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/styles/app_styles.dart';
import '../controller/login_controller.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({super.key, required this.name, required this.icons});
  final String name ;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController  = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(name,textAlign: TextAlign.end,),
          ),
          TextField(
            controller: loginController.userNameTextController,
            decoration: InputDecoration(
              fillColor: AppStyles.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              hintText: "Enter $name",
              prefixIcon:  Icon(icons)
            )
          )
        ],
      ),
    );
  }
}
