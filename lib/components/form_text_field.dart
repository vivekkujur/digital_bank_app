import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import '../base/styles/app_styles.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({super.key, required this.name, required this.icons});
  final String name ;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(name,textAlign: TextAlign.end,),
          ),
          TextField(
            decoration: InputDecoration(
              fillColor: AppStyles.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              hintText: "Enter $name",
              prefixIcon:  Icon(icons)
            )
          )
        ],
      ),
    );
  }
}
