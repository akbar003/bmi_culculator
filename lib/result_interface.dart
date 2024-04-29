import 'package:bmi_culculator/components/custom_bottom_container.dart';
import 'package:bmi_culculator/constants/constant.colours.dart';
import 'package:bmi_culculator/constants/font_style_constant.dart';
import 'package:bmi_culculator/user_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultInterface extends StatelessWidget {
  ResultInterface({required this.resultText,required this.bmi,required this.interpretation});

  String resultText;
  String bmi;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldColour,
      appBar: AppBar(
        backgroundColor: kAppBackgroundColour,
        title: Text('Result View', style: kAppBarStyle,),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Result',
              style: kNumberStyle.copyWith(fontSize: 32,color: Colors.black),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      resultText,
                      style: kResultText,
                    ),
                    Text(
                      bmi.toString(),
                      style: kResultNumberStyle.copyWith(fontSize: 70,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpretation,
                      style: kLabelStyle.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomBottomContainer(btnText: "RE_CALCULATE",
            onpress: () {  Navigator.of(context).pop();},),
        ],
      ),
    );
  }
}
