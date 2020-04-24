import 'dart:convert';

import 'package:covidtracker/faq.dart';
import 'package:covidtracker/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var api = "https://api.covid19india.org/data.json";
  var res;
  var data;
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Container(),
    Faq(),
  ];

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            title: new Text('StateWise', style: TextStyle(
                color: Color.fromRGBO(0, 165, 82, 100),fontWeight: FontWeight.bold
            ),),
            icon: new Icon(Icons.home),
            activeIcon: new Icon(Icons.home, color: Color.fromRGBO(0, 165, 82, 100),),

          ),
          BottomNavigationBarItem(
            title: new Text('Districtwise', style: TextStyle(
                color: Color.fromRGBO(0, 165, 82, 100),fontWeight: FontWeight.bold
            ),),
              icon: new Icon(Icons.storage),
            activeIcon: new Icon(Icons.storage, color: Color.fromRGBO(0, 165, 82, 100),),
          ),
          BottomNavigationBarItem(
           title: new Text('Faq', style: TextStyle(
           color: Color.fromRGBO(0, 165, 82, 100),fontWeight: FontWeight.bold
                   ),),
            icon: new Icon(Icons.more),
            activeIcon: new Icon(Icons.more, color: Color.fromRGBO(0, 165, 82, 100),),
          )
        ],
      ),

      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}