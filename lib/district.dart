import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class District extends StatefulWidget{
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  @override
  var api = "https://api.covid19india.org/state_district_wise.json";
  var res;
  var data;
  var _chosenValue;
  var cityname;
  var datas;
  var active,death,recover,confirm;
  @override



  fetchData() async {
    res = await http.get(api);
    data = jsonDecode(res.body)[_chosenValue];
    datas = data["districtData"][cityname.toString()];
    setState(() {});
    print(datas);
    active=datas["active"];
    death=datas["deceased"].toString();
    confirm=datas["confirmed"].toString();
    recover=datas["recovered"].toString();

  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top:45.0),
                      child: Column(
                        children: <Widget>[
                          Text("DistrictWise Data",style: TextStyle(
                            fontSize:22,
                            color: Color.fromRGBO(0, 165, 82, 100),
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: DropdownButton<String>(
                              value:_chosenValue,
                              elevation:5,
                              underline:Container(),
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 20.0,
                              iconEnabledColor: Color.fromRGBO(0, 165, 82, 100),
                              items: <String>["Andhra Pradesh","Arunachal Pradesh ","Assam","Bihar","Chhattisgarh","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir",
                                "Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab","Rajasthan","Sikkim",
                                "Tamil Nadu","Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal","Andaman and Nicobar Islands","Chandigarh","Dadra and Nagar Haveli",
                                "Daman and Diu","Lakshadweep","Delhi","Puducherry"]
                                  .map<DropdownMenuItem<String>>((String value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                              }).toList(),
                              onChanged: (String value){
                                setState(() {
                                  _chosenValue=value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: Container(
                              width: 250,
                              child: TextFormField(
                                cursorColor:Color.fromRGBO(0, 165, 82, 100),
                                decoration: new InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      borderSide: BorderSide(color:Color.fromRGBO(0, 165, 82, 100))),
                                    focusedBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        borderSide: BorderSide(color:Color.fromRGBO(0, 165, 82, 100))),
                                    contentPadding:
                                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                    hintText:"Enter District Name"),
                                onChanged: (text){
                                  setState(() {
                                    cityname=titleCase(text);
                                    fetchData();
                                  });
                                },
                              ),
                            ),
                          ),
                          res!=null ?
                          Padding(
                            padding: const EdgeInsets.only(top:40.0),
                            child: Card(
                                child: Container(
                                  width: 300,
                                  height: 180,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:5.0,top:10),
                                        child: Text(cityname.toString(),style: TextStyle(
                                            color: Color.fromRGBO(0, 165, 82,100),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20
                                        ),),
                                      ),

                                      Divider(
                                        color: Colors.black,
                                      ),
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text("Active",style: TextStyle(
                                              color:Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                          Text("Confirmed",style: TextStyle(
                                              color:Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                          Text("Recovered",style: TextStyle(
                                              color:Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                          Text("Death",style: TextStyle(
                                              color:Colors.red,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:28.0),
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(active !=null ?active.toString():"",style: TextStyle(
                                                color:Colors.orangeAccent,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16
                                            ),),
                                            Text(confirm !=null ?confirm.toString():"",style: TextStyle(
                                                color:Colors.indigo,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16
                                            ),),
                                            Text(recover !=null ?recover.toString():"",style: TextStyle(
                                                color:Colors.green,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16
                                            ),),
                                            Text(death !=null ?death.toString():"",style: TextStyle(
                                                color:Colors.red,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16
                                            ),),
                                          ],
                                        ),

                                      ),


                                    ],
                                  ),
                                )
                            ),
                          ):Container()
                        ],
                      ),
                    ),
                  ),
    );
  }
    String titleCase(String text) {
      if (text.length <= 1) return text.toUpperCase();
      var words = text.split(' ');
      var capitalized = words.map((word) {
        var first = word.substring(0, 1).toUpperCase();
        var rest = word.substring(1);
        return '$first$rest';
      });
      return capitalized.join(' ');
    }
}
