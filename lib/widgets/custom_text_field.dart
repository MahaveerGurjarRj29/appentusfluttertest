import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? textEditingController;
  IconData? iconData;
  String? hintText;
  bool isObsecre = true;
  bool isEnabled = true;
  TextInputType? keyboardType;

  CustomTextField({
    this.textEditingController,
    this.iconData,
    this.hintText,
    required this.isObsecre,
    required this.isEnabled,
    this.keyboardType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      child: TextFormField(
        enabled: widget.isEnabled,
        controller: widget.textEditingController,
        obscureText: widget.isObsecre,
        keyboardType: widget.keyboardType,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.iconData,
            color: Colors.blueAccent,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
