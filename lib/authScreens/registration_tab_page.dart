import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:appentusfluttertest/DatabaseHandler/DbHelper.dart';
import 'package:appentusfluttertest/authScreens/auth_screen.dart';
import 'package:appentusfluttertest/authScreens/login_tab_page.dart';
import 'package:appentusfluttertest/modal/UserModel.dart';
import 'package:appentusfluttertest/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationTabPage extends StatefulWidget {
  @override
  _RegistrationTabPageState createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  TextEditingController confimPasswrdTextEditingController =
      new TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();
  GlobalKey<FormState> globalKey = new GlobalKey<FormState>();

  String downloadUrlImage = "";

  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();
  var dbHelper;
  String? image;

  getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    image = imgXFile!.path.toString();

    setState(() {
      imgXFile;
    });
    print("Image path $image");
  }

  formValidation() async {
    String uname = nameTextEditingController.text;
    String email = emailTextEditingController.text;
    String passwd = passwordTextEditingController.text;
    String cpasswd = confimPasswrdTextEditingController.text;
    String image = imgXFile.toString();
    String number = numberTextEditingController.text;
    if (globalKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        Fluttertoast.showToast(msg: "password missmatch");
      } else {
        globalKey.currentState!.save();

        UserModel uModel = UserModel(uname, email, passwd, image, number);
        await dbHelper.saveData(uModel).then((userData) {
          Fluttertoast.showToast(msg: "Successfully saved");

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AuthScreen()));
        }).catchError((error) {
          print(error);
          Fluttertoast.showToast(msg: "Error: Data Save Fail");
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              getImageFromGallery();
            },
            child: SingleChildScrollView(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.20,
                backgroundColor: Colors.white,
                backgroundImage: imgXFile == null
                    ? null
                    : FileImage(
                        File(imgXFile!.path),
                      ),
                child: imgXFile == null
                    ? Icon(Icons.add_photo_alternate,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.20)
                    : null,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //input form fields
          Form(
            key: globalKey,
            child: Column(
              children: [
                //name
                CustomTextField(
                  textEditingController: nameTextEditingController,
                  iconData: Icons.person,
                  hintText: "Name",
                  isObsecre: false,
                  isEnabled: true,
                ),
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
                CustomTextField(
                  textEditingController: confimPasswrdTextEditingController,
                  iconData: Icons.lock,
                  hintText: "Confirm Password",
                  isObsecre: true,
                  isEnabled: true,
                ),
                //Confim password
                CustomTextField(
                  textEditingController: numberTextEditingController,
                  iconData: Icons.phone,
                  hintText: "Mobile Number",
                  isObsecre: false,
                  isEnabled: true,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(
                  height: 20,
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
              formValidation();
            },
            child: Text(
              "Sign Up",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
