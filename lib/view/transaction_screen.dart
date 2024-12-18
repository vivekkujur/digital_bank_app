import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import '../base/styles/app_styles.dart';
import '../components/top_bar_component.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: TopBarComponent(
                title: "Transactions",
              ),
            ),
            Expanded(
              flex:1,
              child: ListView.builder(
                itemBuilder: (BuildContext context,int index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                      color: AppStyles.white,
                      border: Border.all(color: AppStyles.primaryColor, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(FluentSystemIcons.ic_fluent_person_filled),
                        title: Text("7366848484"),
                        trailing: Text("100000.00"),
                      ),
                      ListTile(
                        title: Text("Date"),
                        trailing: Text("12-12-2024"),
                      )
                    ],
                  ),
                );
              },itemCount: 6,),
            )
          ],
        ),
      ),
    );;
  }
}
