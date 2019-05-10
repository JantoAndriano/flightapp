import 'package:flutter/material.dart';
import 'package:flightapp/HomeScreen.dart';
import './Themes/Themes.dart';


void main()=>runApp(MaterialApp(
  title: 'FlightList',
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
  theme: appTheme,
  )
);




