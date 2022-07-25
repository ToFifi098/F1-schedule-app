import 'package:flutter/material.dart';
import 'package:web_scrap/Event.dart';
import 'package:web_scrap/race_completed.dart';

class raceInfo extends StatelessWidget {
  final Event event;

  const raceInfo(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return event.status == 'completed' ? RaceCompleted(event) : Text('nothing');
  }
}
