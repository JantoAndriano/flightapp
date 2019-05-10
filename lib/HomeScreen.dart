import 'package:flutter/material.dart';
import 'package:flightapp/CustomNavBar.dart';
import './HomeTopPart/HomeScreenTopPart.dart';
import './HomeBottomPart/HomeScreenBottomPart.dart';


class HomeScreen extends StatefulWidget {
@override
_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: CustomNavBar(),
    body: Column(
      children: <Widget>[
        HomeScreenTopPart(),
        HomeScreenBottomPart(),
      ],
    ),
  );
}
}





