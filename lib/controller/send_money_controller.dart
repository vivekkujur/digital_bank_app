import 'package:digitalbankapp/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../base/constants.dart';
import '../components/error_bottomsheet.dart';
import '../components/success_bottomsheet.dart';

class SendMoneyController extends GetxController{

  late TextEditingController  amountTextController ;
  late TextEditingController  numberTextController ;
  final dio = Dio();
  var  showProgress = false.obs;


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



 Future<Map<String, dynamic>> postSendMoneyApi() async {
    // var box =  await Hive.openBox(HiveBoxKey.DB_BOX);

    var id= Utils.idGenerator();
    var payto =  numberTextController.text;
    var amount = amountTextController.text;
    var time  = DateFormat.yMd().add_jm().format(DateTime.now());
    var payload ={"id": id, "payto":payto,"amount":amount,"time":time};

    try{
      final response = await dio.post("${Constants.BASEURL}/transactions",data: payload);
      return response.data;


    }on DioException catch(e){
      throw Exception( "Failed to login");
    }
  }

  sendMoneyAction(context) async {
    if (amountTextController.text.isNotEmpty &&
        numberTextController.text.isNotEmpty) {

      showProgress.value = true;

      try{
        var response = await postSendMoneyApi();
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return  SuccessBottomsheet(response: response,);
            });

        showProgress.value = false;

      }catch(e){
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return  ErrorBottomsheet();
            });
        showProgress.value = false;

      }



    } else {
      Get.snackbar(
          "Empty field", "Mobile number and amount is mandatory");

      showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return  ErrorBottomsheet();
          });

    }
  }




}