import 'package:flutter/material.dart';
import 'package:flightapp/CustomShapeClipper.dart';

Color firstColor = Color(0xff191654);
Color seconColor = Color(0xff43C6AC);

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xfff3791a),
  fontFamily: 'Oxygen'
) ;

List<String> location = ['Jakarta (JKT)', 'Singapore (SG)'];


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart()
        ],
      ),
    );
  }
}


//FONTS
const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18.0);


class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;

  var isFlightSelected = true;


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
                
                // LOCATION ICON, POPMENU, SETTING ICON SECTIONS
                Padding(
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
                ),
                 // LOCATION ICON, POPMENU, SETTING ICON SECCTIONS
                
                SizedBox(height: 50.0,), //ANOTHER SPACER

                //HEADER SECTIONS
                Text('What would \n you want to find?', style: TextStyle(fontSize: 24.0, color: Colors.white,), textAlign: TextAlign.center,),
                SizedBox(height: 30.0,),
                //HEADER SECTIONS


                //TEXT INPUT SECTIONS
                Padding(
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
                ),
                // TEXT INPUT SECTIONS


                SizedBox(height: 20.0,),


                
                // FLIGHT OR HOTELS SECTIONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      child: ChoiceChip(
                        Icons.flight_takeoff, 'Flights', isFlightSelected),
                      onTap: (){
                        setState(() {
                          isFlightSelected = true;
                        });
                      } ,),
                    SizedBox(width: 20.0,),
                    InkWell(
                      child: ChoiceChip(Icons.hotel, 'Hotels', !isFlightSelected),
                      onTap: (){
                        setState(() {
                          isFlightSelected= false;
                        });
                      },)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


//CHOICECHIP CLASS
///////////////////
///////////////////

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected ?  BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.all(Radius.circular(20.0),
        ),
      ) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(widget.icon, size: 20.0, color: Colors.white,),
          SizedBox(width: 4.0,),
          Text(widget.text,style: TextStyle(
            color: Colors.white, fontSize: 14.0),)
        ],
      ),
    );
  }
}
