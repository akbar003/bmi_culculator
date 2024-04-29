import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({required this.MyColor, this.custchild});
  Color MyColor;
  Widget? custchild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:MyColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: custchild,
    );
  }
}
