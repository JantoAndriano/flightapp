import 'package:flutter/material.dart';
import '../Themes/Themes.dart';



List<String> location = ['Jakarta (JKT)', 'Singapore (SG)'];
var selectedLocationIndex = 0;

class HeaderTop extends StatefulWidget {
  HeaderTop({Key key}) : super(key: key);

  _HeaderTopState createState() => _HeaderTopState();
}

class _HeaderTopState extends State<HeaderTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: <Widget>[
        Icon(Icons.location_on, color: Colors.white,),
        SizedBox(width: 16.0,),
        PopupMenuButton(
          onSelected: (index){
            setState(() {
              selectedLocationIndex = index;
            });
          },
          child: Row(
            children: <Widget>[
              Text(location[selectedLocationIndex], style: dropDownLabelStyle),
              Icon(Icons.keyboard_arrow_down, color: Colors.white)
            ],
          ),
          itemBuilder: (BuildContext context)=><PopupMenuItem<int>>[
            PopupMenuItem(
              child: Text(location[0], style: dropDownMenuItemStyle,),
              value: 0,
            ),
            PopupMenuItem(
              child: Text(location[1], style: dropDownMenuItemStyle,),
              value: 1,
            ),
          ] ,
        ),
        Spacer(),
        Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }
}