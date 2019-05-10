import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<CityCard> cityCards = [
CityCard('assets/images/lasvegas.jpg', 'Las Vegas', 'Feb 2019', '45', 4299, 2250),
CityCard('assets/images/athens.jpg', 'Athens', 'Apr 2019', '50', 9999, 4159),
CityCard('assets/images/sydney.jpeg', 'Sydney', 'Dec 2019', '40', 5999, 2399),
];

final formatCurrency = new NumberFormat.simpleCurrency();
class CityCard extends StatelessWidget{
final String imagePath, cityName, monthYear, discount;
final int oldPrice, newPrice;

CityCard(this.imagePath, this.cityName, this.monthYear, this.discount, this.oldPrice, this.newPrice);

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
                Radius.circular(10)
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 210,
                    width: 160,
                    child: Image.asset(imagePath, fit: BoxFit.cover,),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    height: 60,
                    width: 160,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black, Colors.black.withOpacity(0.1)
                          ]
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    right: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cityName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                color: Colors.white, 
                                fontSize: 18.0),
                            ),
                            Text(
                              monthYear, 
                              style: TextStyle(
                                fontWeight: FontWeight.normal, 
                                color: Colors.white, 
                                fontSize: 14)
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text('$discount%', style: TextStyle(fontSize: 14, color: Colors.black),)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5.0,),
              Text('${formatCurrency.format(newPrice)}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0),),
              SizedBox(width: 5.0,),
              Text('(${formatCurrency.format(oldPrice)})', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 10.0),)
            ],
          )
        ],
      ),
    );
  }
}