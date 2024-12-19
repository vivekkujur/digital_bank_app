import 'package:digitalbankapp/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      "check login api. contains username and password . if login success is return true",
      () async {

    final LoginController controller = LoginController();
    controller.userNameTextController = TextEditingController();
    controller.passwordTextController = TextEditingController();

    controller.userNameTextController.text = "maya";
    controller.passwordTextController.text = "12345";

    var result = await controller.checkLoginDataFromApi();

    expect(result, true);
  });

  test(
      "check login api. contains username and password . if login success is return true",
          () async {

        final LoginController controller = LoginController();
        controller.userNameTextController = TextEditingController();
        controller.passwordTextController = TextEditingController();

        controller.userNameTextController.text = "maya";
        controller.passwordTextController.text = "12345";

        var result = await controller.checkLoginDataFromApi();

        expect(result, true);
      });

}
