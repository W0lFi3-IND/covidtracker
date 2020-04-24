




import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Home extends StatefulWidget
{
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  var api = "https://api.covid19india.org/data.json";
  var res;
  var data;
  @override
  void initState() {
    super.initState();
    fetchData();
  }


  fetchData() async {
    res = await http.get(api);
    data = jsonDecode(res.body)["statewise"];
    setState(() {});
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Center(
        child: res!=null ?
        ListView.builder(
            itemCount:data.length,
            itemBuilder:(context,index){
              var datas = data[index];
              return ListTile(
                  title:Card(
                      child: Container(
                        width: 300,
                        height: 180,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom:5.0,top:10),
                              child: Text("${datas["state"]}",style: TextStyle(
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
                                  Text("${datas["active"]}",style: TextStyle(
                                      color:Colors.orangeAccent,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),),
                                  Text("${datas["confirmed"]}",style: TextStyle(
                                      color:Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),),
                                  Text("${datas["recovered"]}",style: TextStyle(
                                      color:Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),),
                                  Text("${datas["deaths"]}",style: TextStyle(
                                      color:Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  ),),
                                ],
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:30.0,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Text("${datas["lastupdatedtime"]}",style: TextStyle(
                                      color:Colors.black,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 16
                                  ),),
                                ],
                              ),
                            ),

                          ],
                        ),
                      )
                  )
              );
            } )
            :CircularProgressIndicator(),
      ),
    );
  }

  }








