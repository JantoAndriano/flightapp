import 'package:flutter/material.dart';


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

class FlightHotels extends StatefulWidget {
 
  _FlightHotelsState createState() => _FlightHotelsState();
}

class _FlightHotelsState extends State<FlightHotels> {
  bool isFlightSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}