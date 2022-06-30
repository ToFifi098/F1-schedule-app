import 'package:flutter/material.dart';

import 'Event.dart';

Event event = Event("", "", "", "", "", "");

class MyCard extends StatefulWidget {
  MyCard(Event ev){
    event = ev;
  }
  @override
  State<MyCard> createState() => MyCardState();
}

class MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            Container(
              child: Column(children: [
                Text(event.startDate +'-'+event.endDate, textAlign: TextAlign.left,)
              ],),
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0), width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Positioned(
                left: 50,
                top: 12,
                child: Container(
                  padding: EdgeInsets.only(bottom: 2, left: 10, right: 10),
                  color: Colors.white,
                  child: Text(
                    event.cardTitle,
                    style: TextStyle(color: Color.fromARGB(255, 255, 6, 0), fontSize: 12),
                  ),
                )),
          ],
        );
  }
}