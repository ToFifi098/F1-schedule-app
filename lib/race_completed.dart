import 'package:flutter/material.dart';
import 'package:web_scrap/Event.dart';
import 'package:web_scrap/myAppBar.dart';

Event event = Event("", "", "", "", "", "", "", "", "");

class RaceCompleted extends StatefulWidget {
  RaceCompleted(Event ev, {Key? key}) : super(key: key){
    event = ev;
  }

  @override
  State<RaceCompleted> createState() => _RaceCompletedState();
}

class _RaceCompletedState extends State<RaceCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Text(event.place),
    );
  }
}
