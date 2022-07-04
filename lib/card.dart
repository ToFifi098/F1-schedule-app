// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Event.dart';

Event event = Event("", "", "", "", "", "");

class MyCard extends StatefulWidget {
  MyCard(Event ev) {
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
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          '${event.startDate}-${event.endDate}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Formula1',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Text(
                          event.month,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            fontFamily: 'Formula1',
                          ),
                        ),
                      )
                    ]),
              ),
            ],
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
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 6, 0), fontSize: 12),
              ),
            )),
      ],
    );
  }
}
