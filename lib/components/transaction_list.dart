import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/styles/app_styles.dart';
import '../controller/homeController.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, this.homePage= false});

  final homePage ;
  @override
  Widget build(BuildContext context) {
    final HomeController homeController  = Get.find();
    return  Obx(
          ()=> ListView.builder(
          itemBuilder: (BuildContext context,int index){

            var item = homeController.transactionList[index];

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                  color: AppStyles.white,
                  border: Border.all(color: AppStyles.secondary, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(FluentSystemIcons.ic_fluent_person_filled),
                    title: Text(item["payto"].toString()),
                    trailing: Text("₱ "+ item["amount"].toString(),style: AppStyles.textStyleGreyH3.copyWith(fontSize: 14)),
                  ),
                  ListTile(
                    title: Text("Date"),
                    trailing: Text(item["time"].toString(),style: AppStyles.textStyleGreyH3.copyWith(fontSize: 14),),
                  )
                ],
              ),
            );
          },itemCount: homePage ==true ? 2 :homeController.transactionList.length,),

    );

  }
}
