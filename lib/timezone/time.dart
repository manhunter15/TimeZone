
import 'dart:convert';

import 'package:http/http.dart' as http;

void getData()async {
    var client=http.Client();
    var response = await client.get("http://worldtimeapi.org/api/timezone/Asia/Kolkatta");
    Map data=jsonDecode(response.body);
    String datetime=data["utc_datetime"];
    String offset=data["utc_offset"];
    String op=offset[0];
    int hourAdd=int.parse(offset.substring(1,3));
    int minutesAdd=int.parse(offset.substring(4,6));
    DateTime dateTime=DateTime.parse(datetime);
    dateTime=dateTime.add(Duration(hours: hourAdd,minutes: minutesAdd));
    print(datetime+":"+offset+" $hourAdd, $minutesAdd, $dateTime");

  }