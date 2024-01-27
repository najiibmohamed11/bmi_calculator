import 'package:bmi_calculator_flutter/conistant.dart';
import 'package:flutter/material.dart';

// Other imports and code...

class Resualt extends StatefulWidget {
  Resualt(this.getbmi, this.upertext, this.lowertext);
  double getbmi;
  String upertext;
  String lowertext;

  @override
  State<Resualt> createState() => _ResualtState();
}

class _ResualtState extends State<Resualt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR "),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, left: 10),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Color(0xff1B1C2B),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        widget
                            .upertext, // Use widget.upertext instead of hardcoded value
                        style: TextStyle(
                          color: Color.fromARGB(255, 93, 178, 128),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.getbmi.toStringAsFixed(1), // Use widget.getbmi
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.lowertext, // Use widget.lowertext
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              color: Color(bottomContainerColor),
              height: bottomContainerhight,
              child: Center(
                child: Text(
                  "BMI CALCULATE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
