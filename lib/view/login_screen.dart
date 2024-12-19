import 'package:digitalbankapp/base/constants.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../base/styles/app_styles.dart';
import '../base/styles/media.dart';
import '../components/form_password_field.dart';
import '../components/form_text_field.dart';
import '../components/login_button.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController  = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Center(
                child:
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 50),
                 child: SvgPicture.asset(
                   width: Get.width,
                   height: Get.height / 2.5,
                   AddMedia.splash,  semanticsLabel: 'Dart Logo',


                 ),
               ),
              ),
              Text(
                "Its everything and a bank",
                style: AppStyles.headerTextStyle1,
                textAlign: TextAlign.center,
              ),
              FormTextField(
                name: "Username", icons: FluentSystemIcons.ic_fluent_person_filled,
              ),
              FormPasswordField(),
              LoginButton(btnName: "Login",action: ButtonAction.login,),

            ],
          ),
          Obx(() => loginController.showProgress.value == true
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
