import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_scrap/Event.dart';
import 'package:web_scrap/myAppBar.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

Event event = Event("", "", "", "", "", "", "", "", "");

class RaceCompleted extends StatefulWidget {
  RaceCompleted(Event ev, {Key? key}) : super(key: key) {
    event = ev;
  }

  @override
  State<RaceCompleted> createState() => _RaceCompletedState();
}

class _RaceCompletedState extends State<RaceCompleted> {
  bool isLoading = true;

  void getData() async {
    var response = await http.Client().get(
      Uri.parse('https://www.formula1.com${event.href}'),
    );

    dom.Document html = dom.Document.html(
        utf8.decode(latin1.encode(response.body), allowMalformed: true));

    String needle = 'href="';

    var raceHtml = html
        .getElementsByClassName('js-race')[0]
        .getElementsByClassName('f1-timetable--actions')[0]
        .innerHtml
        .substring(html
                .getElementsByClassName('js-race')[0]
                .getElementsByClassName('f1-timetable--actions')[0]
                .innerHtml
                .indexOf(needle) +
            needle.length);

    raceHtml = raceHtml.substring(0, raceHtml.indexOf('"'));

    var qualiHtml = html
        .getElementsByClassName('js-qualifying')[0]
        .getElementsByClassName('f1-timetable--actions')[0]
        .innerHtml
        .substring(html
                .getElementsByClassName('js-qualifying')[0]
                .getElementsByClassName('f1-timetable--actions')[0]
                .innerHtml
                .indexOf(needle) +
            needle.length);

    qualiHtml = qualiHtml.substring(0, qualiHtml.indexOf('"'));

    response = await http.Client().get(
      Uri.parse(raceHtml),
    );

    html = dom.Document.html(
        utf8.decode(latin1.encode(response.body), allowMalformed: true));

    

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      getData();
    }
    return Scaffold(
      appBar: MyAppBar(),
      body: isLoading ? const CircularProgressIndicator() : Text(event.place),
    );
  }
}
