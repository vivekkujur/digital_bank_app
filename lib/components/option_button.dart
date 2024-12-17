import 'package:flutter/material.dart';

import '../base/styles/app_styles.dart';
import '../base/styles/media.dart';

class OptionButton extends StatefulWidget {
  const OptionButton({super.key, required this.buttonName, required this.icons});
  final String buttonName;
  final String icons;



  @override
  State<OptionButton> createState() => _OptionButtonState(buttonName,icons);
}

class _OptionButtonState extends State<OptionButton> {
  final String buttonName;
  final String icons;

  _OptionButtonState(this.buttonName,this.icons);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        alignment: Alignment.center,
        width: 100,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppStyles.gray3,
                borderRadius: BorderRadius.circular(10),
                border:
                Border.all(width: 0, color: AppStyles.primaryColor),
              ),
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(icons))
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
                alignment: Alignment.center,
                child: Text( buttonName ,style: AppStyles.textStyleGreyH3.copyWith(fontSize: 16),textAlign: TextAlign.center)
            ),

          ],
        ),
      ),
    );
  }
}
