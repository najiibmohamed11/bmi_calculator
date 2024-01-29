import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 300, child: Image.asset("assets/firsscreenimg.png")),
          SizedBox(
            height: 20,
          ),
          Text(
            "IMPORTANCE OF BMI",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text(
              "calculate  you body mass index"
              "before you become obese or"
              "underweight",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
          ),
        ],
      )),
    );
  }
}
