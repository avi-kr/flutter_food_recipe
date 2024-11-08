import 'package:flutter/material.dart';
import 'package:recipe/core/shared/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTimeUser();
  }

  Future<void> _checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool(AppStrings.preKeyIsFirstTime) ?? true;

    if (isFirstTime) {
      await prefs.setBool(AppStrings.preKeyIsFirstTime, false);
      Navigator.pushReplacementNamed(context, AppStrings.screenPathIntro);
    } else {
      Navigator.pushReplacementNamed(context, AppStrings.screenPathHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppStrings.loading)),
    );
  }
}
