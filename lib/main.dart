import 'package:flutter/material.dart';
import 'package:covidtracker/landingpage.dart';
void main()
{
 runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
     title:"Covid 19 Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home:LandingPage(),
    );
  }

}