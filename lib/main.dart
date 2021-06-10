import 'package:calendar/color_convert.dart';
import 'package:calendar/pages/bigview_page.dart';
import 'package:calendar/pages/smallview_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        // child: TableEventsExample(),
        child: Container(
          color: mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 3, child: SizedBox()),
              Expanded(flex: 4, child: chooseTypeCalendar()),
              Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

class chooseTypeCalendar extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: mainColor,
    body: Container(
        margin: EdgeInsets.all(25),
        child: GridView.count(crossAxisCount: 2, children: <Widget>[
          GestureDetector(
            onTap: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SmallViewPage()),
                ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 15,
                  color: lightOrangeColor,
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Icon(Icons.event,
                                  size: 50.0, color: darkBlueColor)),
                          Expanded(
                              flex: 1,
                              child: Text("Small View",
                                  style: TextStyle(
                                      fontSize: 20, color: darkBlueColor))),
                        ]),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BigViewPage())),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 15,
                  color: lightOrangeColor,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Icon(Icons.calendar_view_month,
                                  size: 50.0, color: darkBlueColor)),
                          Expanded(
                              flex: 1,
                              child: Text("Big View",
                                  style: TextStyle(
                                      fontSize: 20, color: darkBlueColor))),
                        ]),
                  )),
            ),
          ),
        ])),
  );
}
}

