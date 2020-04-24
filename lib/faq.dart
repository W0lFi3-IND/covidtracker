import 'package:covidtracker/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:45.0),
                child: Text("Do's and Don't",style: TextStyle(
                  fontWeight:FontWeight.w700,
                  fontSize: 26,
                  color: Color.fromRGBO(0, 165, 82,100),
                ),),
              ),
              Row(
                children: <Widget>[
                  Lottie.network(
                      'https://assets3.lottiefiles.com/private_files/lf30_QLsD8M.json',width: 200,height: 200),
                  Text("Practice Social Distancing",style: TextStyle(
                    fontSize: 16,
                    fontWeight:FontWeight.bold
                  ),)
                ],
              ),
              Row(
                children: <Widget>[
                  Lottie.network(
                      'https://assets2.lottiefiles.com/private_files/lf30_yQtj4O.json',width: 200,height: 200),
                  Text("Use Sanitizer and keep your \n hands clean",style: TextStyle(
                      fontSize: 16,
                      fontWeight:FontWeight.bold
                  ),)
                ],
              ),
            Row(
          children: <Widget>[
              Lottie.network('https://assets4.lottiefiles.com/private_files/lf30_oGbdoA.json',width: 200,height: 200),
              Text("Wear mask while going out",style: TextStyle(
              fontSize: 16,
              fontWeight:FontWeight.bold
          ),)
          ],
        ),
              Row(
                children: <Widget>[
                  Lottie.network('https://assets6.lottiefiles.com/private_files/lf30_wBcF24.json',width: 200,height: 200),
                  Text("Visit hospital and inform \nauthorities if you are having\n CoVid19 Symptoms",style: TextStyle(
                      fontSize: 16,
                      fontWeight:FontWeight.bold
                  ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}