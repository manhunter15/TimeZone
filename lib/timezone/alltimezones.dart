import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:timezone/timetemplate.dart';

class AllTimeZones extends StatefulWidget  {
  var values;
  AllTimeZones({this.values});
  @override
  _AllTimeZonesState createState() => _AllTimeZonesState();
}

class _AllTimeZonesState extends State<AllTimeZones> {

  bool completed=false;
  List data;
  @override
  void initState() {
    super.initState();
    getAllData();
  }
  void getAllData() async {
    print("loading timezones");
    Response response = await get("http://worldtimeapi.org/api/timezones");
     data = jsonDecode(response.body);
     for(var i=0;i<data.length;i++){
       data[i].contains(values);
     }
     setState(() {
      completed=true;
    });
  }

    @override
  Widget build(BuildContext context) {

    if(completed) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
          return RaisedButton.icon(
            onPressed: (){},
            icon: Icon(Icons.edit_location),
            label: Center(child: Text('${data[index]}',style: TextStyle(
              fontWeight: FontWeight.bold
            ),)),
          );
        }
      );
    }
    else {
      return Container(
        height: 50,
        child: Card(
            child: Center(child: Text('Loading Data',style: TextStyle(
                fontWeight: FontWeight.bold
            ),))
        ),
      );
    }
  }
}


  //
  //
  // void getData()async {
  //   Response response=await get("http://worldtimeapi.org/api/timezone/Asia/Kolkatta");
  //   Map data=jsonDecode(response.body);
  //   String datetime=data["utc_datetime"];
  //   String offset=data["utc_offset"];
  //   String op=offset[0];
  //   int hourAdd=int.parse(offset.substring(1,3));
  //   int minutesAdd=int.parse(offset.substring(4,6));
  //   DateTime dateTime=DateTime.parse(datetime);
  //   dateTime=dateTime.add(Duration(hours: hourAdd,minutes: minutesAdd));
  //   print(datetime+":"+offset+" $hourAdd, $minutesAdd, $dateTime");
  //
  // }


