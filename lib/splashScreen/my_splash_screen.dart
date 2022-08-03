import 'dart:async';

import 'package:appentusfluttertest/authScreens/auth_screen.dart';
import 'package:appentusfluttertest/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  splashScreenTimer() {
    Timer(const Duration(seconds: 3), () async {
      checkingTheSavedData();
    });
  }

  @override
  void initState() {
    super.initState();
    splashScreenTimer();
  }

  checkingTheSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('user_name');
    if (username == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => AuthScreen()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => MyHomePage()),
          (Route<dynamic> route) => false);
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(200, 33, 147, 176),
              Color.fromARGB(109, 109, 213, 237),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("images/appentus_logo.jpg"),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  "Appentus Technologies",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 3,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
