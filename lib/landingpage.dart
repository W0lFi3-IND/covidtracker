import 'dart:async';

import 'package:covidtracker/homepage.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget
{
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(backgroundImage:AssetImage('assets/images/mask.jpg'),radius: 100,)
            ,Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Text("You have only one job to do.Don't ruin it",style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(0, 165, 82,100),
                fontWeight: FontWeight.w600
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:60),
              child: LinearProgressIndicator(backgroundColor: Color.fromRGBO(0, 165, 82,100),
              valueColor:AlwaysStoppedAnimation<Color>(Colors.white),
            )
            )
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds:4 );
    return new Timer(duration,route);
  }
  route(){
    Navigator.pushReplacement(context,MaterialPageRoute(
        builder: (context) =>HomePage()
    )
    );

  }
}