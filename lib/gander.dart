import 'package:bmi_calculator_flutter/conistant.dart';
import 'package:flutter/material.dart';
class Gander extends StatelessWidget {
  const Gander(this.gandericon, this.GanderType);
  final IconData gandericon;
  final String GanderType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gandericon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          GanderType,
          style: labeltextstyl ,
        ),
      ],
    );
  }
}

