import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/constants.dart';
import '../view/home_screen.dart';

class HomeController extends GetxController{

  var balance  = "100.00".obs;
  var showBalance = true.obs;
  var transactionList = [].obs;

  final dio = Dio();

  late TextEditingController  userNameTextController ;
  late TextEditingController  passwordTextController ;

  getTransactionApi() async {
    try{
      final response = await dio.get("${Constants.BASEURL}/transactions");
      print(response.data);
      transactionList.value  = response.data;

    }on DioException catch(e){
      throw Exception( "Failed to login");
    }
  }


  @override
  void onInit() {
    super.onInit();
    getTransactionApi();
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void onClose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }


}