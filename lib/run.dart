import 'package:flutter/cupertino.dart';

import 'timezone/alltimezones.dart';

import 'package:flutter/material.dart';

class Run extends StatefulWidget {
  @override
  _RunState createState() => _RunState();
}

class _RunState extends State<Run> {
  final textController=TextEditingController();
  String searchValue;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time and Zones"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(50),
                ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Here'
                          ),
                          controller: textController,
                          autofocus: true,
                          onChanged: (String val)=>searchValue=val,
                        ),
                      ),
                      IconButton(onPressed:(){print(textController.text);},
                        icon:Icon(Icons.search),
                      color: Colors.blue[700],
                      ),
                    ]
                ),
              ),
            ),
            // RaisedButton.icon(onPressed: (){}, icon:Icon(Icons.search), label: Text("this must be the search bar"),),
            Expanded(child: AllTimeZones(values: searchValue)),
          ],
        ),
      ),
    );
  }
}
