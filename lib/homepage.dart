import 'dart:convert';

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
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        Text("${datas["state"]}")
                      ],
                    ),
                  ),
                )
              );
            } )
            :CircularProgressIndicator(),
      ),
    );
  }
}