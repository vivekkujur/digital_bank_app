import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/styles/app_styles.dart';
import '../controller/login_controller.dart';

class FormPasswordField extends StatelessWidget {
  const FormPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController  = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "Password",
              textAlign: TextAlign.end,
            ),
          ),
          TextField(
            controller: loginController.passwordTextController,
            decoration: InputDecoration(
                fillColor: AppStyles.white,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter Password",
              prefixIcon: const Icon(FluentSystemIcons.ic_fluent_lock_filled),
              suffixIcon:  Icon(FluentSystemIcons.ic_fluent_eye_hide_filled)
            ),
            obscureText: true,
          )
        ],
      ),
    );
  }
}
