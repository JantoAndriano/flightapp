import 'package:flutter/material.dart';
import 'package:flightapp/CustomShapeClipper.dart';
import '../CityCards.dart';
import '../HomeTopPart/HeaderTop.dart';
import '../HomeTopPart/TextInput.dart';
import './FlightHotels.dart';
import '../Themes/Themes.dart';




List<String> location = ['Jakarta (JKT)', 'Singapore (SG)'];

//FONTS
const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18.0);

class HomeScreenTopPart extends StatefulWidget {
@override
_HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
var selectedLocationIndex = 0;


@override
Widget build(BuildContext context) {
  return Stack(
    children: <Widget>[
      ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: 400.0, decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [firstColor, seconColor]
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0,), // TOP SPACER
              HeaderTop(),
              SizedBox(height: 50.0,), //ANOTHER SPACER

              //HEADER SECTIONS
              Text('What would \n you want to find?', style: TextStyle(fontSize: 24.0, color: Colors.white,), textAlign: TextAlign.center,),
              SizedBox(height: 30.0,),
              //HEADER SECTIONS

              TextInput(),
              SizedBox(height: 20.0,),
                            
              // FLIGHT OR HOTELS SECTIONS
              FlightHotels()
            ],
          ),
        ),
      )
    ],
  );
}
}


var viewAllStyle = TextStyle(color: Color(0xff43C6AC), fontSize: 14.0);
var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Hot Offer...', style: dropDownMenuItemStyle),
          Spacer(),
          Text('View all (3)', style: viewAllStyle,),
        ],
      ),
    ),
    Container(
      height: 250.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    )
  ],
);

