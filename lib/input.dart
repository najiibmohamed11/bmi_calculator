import 'package:bmi_calculator_flutter/calculation.dart';
import 'package:bmi_calculator_flutter/conistant.dart';
import 'package:bmi_calculator_flutter/gander.dart';
import 'package:bmi_calculator_flutter/resualt.dart';
import 'package:bmi_calculator_flutter/riusablewidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

const active = 0xff2E2A3A;
const inactive = 0xff121324;
var malecolor = inactive;
var femailcolor = inactive;
int height = 188;
int weighttracker = 60;
int age = 18;

enum GanderTracker { male, femail }

class Input_file extends StatefulWidget {
  const Input_file({super.key});

  @override
  State<Input_file> createState() => _Input_fileState();
}

class _Input_fileState extends State<Input_file> {
  @override
  Widget build(BuildContext context) {
    // 0= male 1 = femail
    // void colorseter(GanderTracker T) {
    //   if (T == GanderTracker.male) {
    //     if (malecolor == inactive) {
    //       malecolor = active;
    //       femailcolor = inactive;
    //     } else {
    //       malecolor = inactive;
    //     }
    //   }
    //   if (T == GanderTracker.femail) {
    //     if (femailcolor == inactive) {
    //       femailcolor = active;
    //       malecolor = inactive;
    //     } else {
    //       femailcolor = inactive;
    //     }
    //   }
    // }

//     var malecolor = inactive;
// var femailcolor = inactive;//if i put this variabls inside my class they would not work unles move to the up
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: RiusableWidget(
                      onpressed: () {
                        setState(
                          () {
                            malecolor =
                                malecolor == inactive ? active : inactive;
                            femailcolor = inactive;
                          },
                        );
                      },
                      Color(malecolor),
                      costum: Gander(FontAwesomeIcons.mars, "MALE"),
                    ),
                  ),
                  Expanded(
                    child: RiusableWidget(
                      onpressed: () {
                        setState(
                          () {
                            femailcolor =
                                femailcolor == inactive ? active : inactive;
                            malecolor = inactive;
                          },
                        );
                      },
                      Color(femailcolor),
                      costum: Gander(FontAwesomeIcons.mars, 'FEMAIL'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RiusableWidget(
                Color(riusableWidgetColor),
                costum: Column(
                  children: [
                    Text(
                      "Heigh",
                      style: labeltextstyl,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(height.toString(), style: knumbertextstyle),
                        Text("cm")
                      ],
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xffE51048),
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          max: 220.0,
                          min: 120.0,
                          inactiveColor: Color(0xff7A7984),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: RiusableWidget(
                      Color(riusableWidgetColor),
                      costum: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "weight",
                            style: labeltextstyl,
                          ),
                          Text(
                            weighttracker.toString(),
                            style: knumbertextstyle,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: roundedbuton(FontAwesomeIcons.minus,
                                        () {
                                  setState(() {
                                    weighttracker--;
                                  });
                                })),
                                Expanded(
                                    child:
                                        roundedbuton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weighttracker++;
                                  });
                                }))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RiusableWidget(
                      Color(riusableWidgetColor),
                      costum: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "age",
                            style: labeltextstyl,
                          ),
                          Text(
                            age.toString(),
                            style: knumbertextstyle,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: roundedbuton(FontAwesomeIcons.minus,
                                        () {
                                  setState(() {
                                    age--;
                                  });
                                })),
                                Expanded(
                                    child:
                                        roundedbuton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    age++;
                                  });
                                }))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                calculations calculateobj =
                    new calculations(height, weighttracker);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Resualt(calculateobj.getbmi(),calculateobj.textweight(),calculateobj.longtext());
                  }),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                color: Color(bottomContainerColor),
                height: bottomContainerhight,
                child: Center(
                    child: Text(
                  "CALCULATE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                )),
              ),
            )
          ],
        ));
  }
}

class roundedbuton extends StatelessWidget {
  roundedbuton(this.customicon, this.pressed);
  final IconData customicon;
  final Function() pressed;
  // const roundedbuton({super.key});
  // final shape:CircleBorder();

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(customicon),
      onPressed: pressed,
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xfff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
