import 'package:bmi_culculator/constants/constant.colours.dart';
import 'package:bmi_culculator/constants/font_style_constant.dart';
import 'package:flutter/material.dart';

class CustomBottomContainer extends StatelessWidget {
   CustomBottomContainer({required this.btnText,required this.onpress});

  String btnText;
  void Function() onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 80,
        width: double.infinity,
        color: kInActiveColour,
        child: Center(
          child: Text(
            btnText,
            style: kBottomContainerFontStyle,
          ),
        ),
      ),
    );
  }
}
