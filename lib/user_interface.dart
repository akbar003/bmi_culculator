import 'dart:ui';

import 'package:bmi_culculator/components/custom_bottom_container.dart';
import 'package:bmi_culculator/components/custom_circular_btn.dart';
import 'package:bmi_culculator/components/custom_container.dart';
import 'package:bmi_culculator/components/icon_content.dart';
import 'package:bmi_culculator/constants/constant.colours.dart';
import 'package:bmi_culculator/constants/font_style_constant.dart';
import 'package:bmi_culculator/result_interface.dart';
import 'package:bmi_culculator/view_model/bmi_result_culculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({super.key});

  @override
  State<UserInterface> createState() => _UserInterfaceState();
}

enum Gender { MALE, FEMALE }

class _UserInterfaceState extends State<UserInterface> {
  int height = 120;
  int weight = 60;
  int age = 22;
  // Color maleContainerColour = kInActiveColour;
  // Color femaleContainerColour = kInActiveColour;
  // getColor(String genter) {
  //   if (genter == 'MALE') {
  //     maleContainerColour = kActiveColour;
  //   } else {
  //     maleContainerColour = kInActiveColour;
  //   }
  //   //FEMALE
  //   if (genter == 'FEMALE') {
  //     femaleContainerColour = kActiveColour;
  //   } else {
  //     femaleContainerColour = kInActiveColour;
  //   }
  // }
  Gender? selectGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldColour,
      appBar: AppBar(
        backgroundColor: kAppBackgroundColour,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: kContentColour),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.MALE;
                        // getColor('MALE');
                      });
                    },
                    child: CustomContainer(
                      MyColor: selectGender == Gender.MALE
                          ? kActiveColour
                          : kInActiveColour,
                      // MyColor: maleContainerColour,
                      // MyColor: kInActiveColour,
                      custchild:
                          IconContent(iconData: Icons.male, label: "MALE"),
                    ),
                  ),
                ),
                //femalecontainer
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.FEMALE;
                        // getColor('FEMALE');
                      });
                    },
                    child: CustomContainer(
                      MyColor: selectGender == Gender.FEMALE
                          ? kActiveColour
                          : kInActiveColour,
                      // MyColor: femaleContainerColour,
                      // MyColor: kInActiveColour,
                      custchild:
                          IconContent(iconData: Icons.female, label: "FEMALE"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomContainer(
              MyColor: kInActiveColour,
              custchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                    // TextStyle(color: kContentColour, fontSize: 20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                            color: kContentColour, fontSize: 40),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(color: kContentColour, fontSize: 20),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kContentColour,
                        overlayColor: Colors.black45,
                        inactiveTrackColor: kActiveColour,
                        thumbColor: kContentColour,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 16,
                        )),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 180,
                        // activeColor: kContentColour,
                        // inactiveColor: kActiveColour,
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomContainer(
                    MyColor: kInActiveColour,
                    custchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCircularBtn(
                              iconData: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            CustomCircularBtn(
                              iconData: Icons.remove,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // AGE
                Expanded(
                  child: CustomContainer(
                    MyColor: kInActiveColour,
                    custchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCircularBtn(
                              iconData: Icons.add,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            CustomCircularBtn(
                              iconData: Icons.remove,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomBottomContainer(
              btnText: 'CALCULATE',
              onpress: () {
                BMIResultCalculator bmicalculate=BMIResultCalculator(calculatedHeight: height, calculatedWeight: weight);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultInterface(
                        bmi:bmicalculate.bmiCalculate(),
                        resultText: bmicalculate.bmiCalculate(),
                        interpretation: bmicalculate.getInterpretation())));
              }),
        ],
      ),
    );
  }
}
