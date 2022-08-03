import 'package:appentusfluttertest/authScreens/login_tab_page.dart';
import 'package:appentusfluttertest/authScreens/registration_tab_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(250, 33, 147, 176),
                  Color.fromARGB(150, 109, 213, 237),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: const Text(
            "Appentus",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 3),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white54,
            indicatorWeight: 6,
            tabs: [
              Tab(
                text: "Log In",
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
              Tab(
                text: "Sign Up",
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Container(
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
          child: TabBarView(
            children: [
              LoginTabPage(),
              RegistrationTabPage(),
            ],
          ),
        ),
      ),
    );
  }
}
