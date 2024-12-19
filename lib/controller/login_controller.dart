
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

  getLoginApi() async {
    showProgress.value = true;
    var box =  await Hive.openBox(HiveBoxKey.DB_BOX);
    var response = await checkLoginDataFromApi();
    if(response==true){
      box.put(HiveBoxKey.IS_LOGIN , true);
      box.put(HiveBoxKey.USER_NAME , userNameTextController.text);
      Get.offAll(HomeScreen());
      showProgress.value = false;
    }
    showProgress.value = false;

  }

 Future<bool> checkLoginDataFromApi ()async{
    try{
      final response = await dio.get("${Constants.BASEURL}/profile");
      if(response.data["userName"]==userNameTextController.text && response.data["password"]==passwordTextController.text ){
        return true;
      }
      return false;

    }on DioException catch(e){
      throw Exception( "Failed to login");

    }
  }

  signOut() async {
    var box =  await Hive.openBox(HiveBoxKey.DB_BOX);

    box.put(HiveBoxKey.IS_LOGIN , false);
    box.put(HiveBoxKey.USER_NAME , "");
    Get.offAll(LoginScreen());


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