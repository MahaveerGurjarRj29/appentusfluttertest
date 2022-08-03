import 'package:appentusfluttertest/DatabaseHandler/DbHelper.dart';
import 'package:appentusfluttertest/modal/UserModel.dart';
import 'package:appentusfluttertest/screens/home_screen.dart';
import 'package:appentusfluttertest/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginTabPage extends StatefulWidget {
  @override
  _LoginTabPageState createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();
  var dbHelper;
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "images/login.jpg",
              //height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 0.80,
            ),
          ),
          Form(
            key: globalKey,
            child: Column(
              children: [
                //email
                CustomTextField(
                  textEditingController: emailTextEditingController,
                  iconData: Icons.email,
                  hintText: "Enter valid email address",
                  isObsecre: false,
                  isEnabled: true,
                ),

                //password
                CustomTextField(
                  textEditingController: passwordTextEditingController,
                  iconData: Icons.lock,
                  hintText: "Password",
                  isObsecre: true,
                  isEnabled: true,
                ),
                //Confim password

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            onPressed: () {
              login();
            },
            child: Text(
              "Log In",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  login() async {
    String email = emailTextEditingController.text;
    String passwd = passwordTextEditingController.text;
    print(email);

    if (email.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter User ID");
    } else if (passwd.isEmpty) {
      Fluttertoast.showToast(msg: "Please Enter Password");
    } else {
      await dbHelper!.getLoginUser(email, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => MyHomePage()),
                (Route<dynamic> route) => false);
          });
        } else {
          Fluttertoast.showToast(msg: "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        Fluttertoast.showToast(msg: "Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("user_name", user.user_name.toString());
    sp.setString("email", user.email.toString());
    sp.setString("password", user.password.toString());
    sp.setString("image", user.image.toString());
    sp.setString("number", user.number.toString());
  }
}
