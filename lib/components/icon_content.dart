import 'package:bmi_culculator/constants/constant.colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.iconData,required this.label,});
  IconData iconData;
  String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            iconData,
          color: kContentColour,
          size: 70,
        ),
        SizedBox(height: 10,),
        Text(
          label,
          style:TextStyle(color: kContentColour,fontSize: 20),
        )
      ],
    );
  }
}
