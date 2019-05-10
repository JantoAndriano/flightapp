import 'package:flutter/material.dart';
import 'package:flightapp/Themes/Themes.dart';


class TextInput extends StatefulWidget {


  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: TextField(
          controller: TextEditingController(text: 'Type here....'),
          style: dropDownMenuItemStyle,
          cursorColor: appTheme.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
            suffixIcon: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: Icon(Icons.search, color: Colors.black,),
            ),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}