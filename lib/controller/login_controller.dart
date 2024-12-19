
import 'package:digitalbankapp/view/home_screen.dart';
import 'package:digitalbankapp/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../base/constants.dart';

class LoginController  extends GetxController{

  final dio = Dio();

  late TextEditingController  userNameTextController ;
  late TextEditingController  passwordTextController ;
  var showProgress = false.obs;

  // Future<List<dynamic>>
  getLoginApi() async {
    showProgress.value = true;
    var box =  await Hive.openBox(HiveBoxKey.DB_BOX);

    try{
     final response = await dio.get("${Constants.BASEURL}/profile");
     if(response.data["userName"]==userNameTextController.text && response.data["password"]==passwordTextController.text ){
       box.put(HiveBoxKey.IS_LOGIN , true);
       box.put(HiveBoxKey.USER_NAME , userNameTextController.text);

       Get.to(HomeScreen());
     }
     showProgress.value = false;

    }on DioException catch(e){
      showProgress.value = false;

      throw Exception( "Failed to login");
   }

  }

  signOut() async {
    var box =  await Hive.openBox(HiveBoxKey.DB_BOX);

    box.put(HiveBoxKey.IS_LOGIN , false);
    box.put(HiveBoxKey.USER_NAME , "");
    Get.to(LoginScreen());

  }



  @override
  void onInit() {
    super.onInit();
    checkIslogin();
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void onClose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  checkIslogin() async {
    var box =  await Hive.openBox(HiveBoxKey.DB_BOX);
    if(box.get(HiveBoxKey.IS_LOGIN) == true){
      Get.to(HomeScreen());
    }
  }

}