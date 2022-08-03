import 'package:appentusfluttertest/authScreens/auth_screen.dart';
import 'package:appentusfluttertest/modal/UserModel.dart';
import 'package:appentusfluttertest/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String? user_name;
  String? email;
  String? number;
  String? image;
  String? password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSP();
  }

  setSP() async {
    final SharedPreferences sp = await _pref;
    user_name = sp.getString("user_name");
    email = sp.getString("email");
    password = sp.getString("password");
    image = sp.getString("image");
    number = sp.getString("number");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => AuthScreen()),
                  (Route<dynamic> route) => false);
            },
            child: Icon(Icons.logout),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    child: Text("$image"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  // color: Color.fromRGBO(255, 243, 243, 100),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                        child: Container(
                          height: 60,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Name:- $user_name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.redAccent),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                        child: Container(
                          height: 60,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Mobile:- $number",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  width: 1.0, color: Colors.redAccent)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                        child: Container(
                          height: 60,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Email Id :- $email",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  width: 1.0, color: Colors.redAccent)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
