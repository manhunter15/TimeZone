
import 'package:flutter/material.dart';

class TimeTemplate extends StatefulWidget {
  List name;
  TimeTemplate(this.name);

  @override
  _TimeTemplateState createState() => _TimeTemplateState(name);
}

class _TimeTemplateState extends State<TimeTemplate> {
  List name;
  _TimeTemplateState(this.name);
  @override
  Widget build(BuildContext context) {
    for(String s in name){
      return Text(s);
    }

  }
}
