import 'package:calendar/color_convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/table_models.dart';

class SmallViewItem extends StatelessWidget {
  final Event event;
  final Color colorType;
  final Color colorText;

  SmallViewItem(this.event, this.colorType, this.colorText);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: colorType,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.amber,
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  this.event.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorText,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(this.event.startHour),
                    Text(" - "),
                    Text(this.event.endHour),
                    SizedBox(
                      width: 10,
                    ),
                    Text("GMT +8"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.grey, // Button color
                        child: InkWell(
                          splashColor: Colors.red, // Splash color
                          child: SizedBox(
                              width: 45,
                              height: 45,
                              child: Icon(Icons.person_rounded)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "View clients Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: HexColor.fromHex("#0F4C81"),
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
            ClipOval(
              child: Material(
                color: Colors.blue, // Button color
                child: InkWell(
                  splashColor: Colors.red, // Splash color
                  child: SizedBox(
                      width: 55,
                      height: 55,
                      child: Icon(Icons.video_call_outlined)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
