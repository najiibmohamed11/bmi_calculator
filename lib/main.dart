import 'package:bmi_calculator_flutter/input.dart';
import 'package:bmi_calculator_flutter/inintialscreen/onbordingscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Check if onboarding has been completed before
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
  
  // Determine which screen to show
  Widget initialScreen;
  if (onboardingCompleted) {
    // If onboarding has been completed, navigate to your main application screen
    initialScreen = Input_file(); // Change this to your main application screen
  } else {
    // If onboarding has not been completed, show the onboarding screen
    initialScreen = Onboardingscreen();
    // Set the flag to indicate that onboarding has been completed
    prefs.setBool('onboardingCompleted', true);
  }

  runApp(MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;

  const MyApp({Key? key, required this.initialScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          backgroundColor: Colors.black,
        ),
      ),
      home: initialScreen,
    );
  }
}
