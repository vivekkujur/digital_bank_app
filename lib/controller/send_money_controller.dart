import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendMoneyController extends GetxController{

  late TextEditingController  amountTextController ;
  late TextEditingController  numberTextController ;


  @override
  void onInit() {
    super.onInit();
    amountTextController = TextEditingController();
    numberTextController = TextEditingController();
  }

  @override
  void onClose() {
    amountTextController.dispose();
    numberTextController.dispose();
    super.onClose();
  }




}