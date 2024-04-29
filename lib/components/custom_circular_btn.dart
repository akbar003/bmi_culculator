import 'package:bmi_culculator/constants/constant.colours.dart';
import 'package:flutter/material.dart';

class CustomCircularBtn extends StatelessWidget {
  CustomCircularBtn({required this.iconData,required this.onPress});
  IconData iconData;
  void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white54,
          shape: BoxShape.circle
        ),
        child: Icon(iconData,size: 35,color: Colors.white,),
      ),
    );
  }
}
