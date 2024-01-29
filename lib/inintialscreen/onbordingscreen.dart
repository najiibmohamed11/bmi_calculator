import 'package:bmi_calculator_flutter/conistant.dart';
import 'package:bmi_calculator_flutter/inintialscreen/screen1.dart';
import 'package:bmi_calculator_flutter/inintialscreen/screen2.dart';
import 'package:bmi_calculator_flutter/inintialscreen/screen3.dart';
import 'package:bmi_calculator_flutter/input.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  PageController _controller = PageController();

  bool onlastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (value) {
            setState(() {
              onlastpage = (value == 2 ? true : false);
            });
          },
          controller: _controller,
          children: [Screen1(), Screen2(), Screen3()],
          //dot indicator
        ),
        Container(
          alignment: Alignment(0.0, 0.75),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotWidth: 15.0,
              dotHeight: 13.0,
              activeDotColor: Color(bottomContainerColor),
            ),
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.95),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Input_file();
                          },
                          // fullscreenDialog:
                          //   true, // Set fullscreenDialog to true
                        ),
                      );
                    },
                    child: Text("skip")),
                InkWell(
                  onTap: () {
                    onlastpage
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                            return Input_file();
                          }))
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInCirc);
                  },
                  child: Row(
                    children: [
                      onlastpage ? Text("DONE") : Text("NEXT"),
                      Icon(Icons.arrow_forward_sharp),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
