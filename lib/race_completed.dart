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
  var raceResults = [[]]; 

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

    print(html.getElementsByClassName('resultsarchive-table')[0].children[1].children[0].children.length);

    for(int i = 0; i < html.getElementsByClassName('resultsarchive-table')[0].children[1].children.length; i++){
      var temp = html.getElementsByClassName('resultsarchive-table')[0].children[1].children[i].children;
      

    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      getData();
    }
    print(raceResults[0]);
    return Scaffold(
      appBar: const MyAppBar(),
      body: isLoading ? const CircularProgressIndicator() : Text("ds"),
    );
  }
}
