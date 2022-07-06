import 'dart:convert';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web_scrap/Event.dart';
import 'package:web_scrap/card.dart';

import 'myAppBar.dart';


void main() => runApp(const MyWidget());

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Event> eventList = [];
  bool isLoading = true;

  void getData() async {
    final response = await http.Client().get(
      Uri.parse('https://www.formula1.com/en/racing/2022.html'),
    );

    dom.Document html = dom.Document.html(
        utf8.decode(latin1.encode(response.body), allowMalformed: true));

    var eventListChild = html
        .getElementsByClassName('event-list')[0]
        .children[0]
        .children[0]
        .children;

    for (int i = 1; i < eventListChild.length; i++) {
      String needle = '<img data-src="';

      var innerHtm = eventListChild[i].getElementsByClassName('country-flag')[0].innerHtml;
      innerHtm = eventListChild[i].getElementsByClassName('country-flag')[0].innerHtml.substring(innerHtm.indexOf(needle) + needle.length);
      String img = innerHtm.substring(0, innerHtm.indexOf('"'));

      innerHtm = eventListChild[i].innerHtml;
      innerHtm = innerHtm.substring(innerHtm.indexOf('"') + 1);
      String href = innerHtm.substring(0, innerHtm.indexOf('"'));

      eventList.add(Event(
          eventListChild[i].getElementsByClassName('card-title')[0].text,
          eventListChild[i].getElementsByClassName('start-date')[0].text,
          eventListChild[i].getElementsByClassName('end-date')[0].text,
          eventListChild[i].getElementsByClassName('month-wrapper')[0].text,
          eventListChild[i].getElementsByClassName('event-place')[0].text,
          eventListChild[i].getElementsByClassName('event-title')[0].text,
          img,
          href));
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
    return MaterialApp(
      home: Scaffold(
        appBar:const MyAppBar(),
        body: isLoading
            ? const CircularProgressIndicator()
            : ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: eventList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyCard(eventList[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Container(padding:const EdgeInsets.all(1),),
              ),
      ),
    );
  }
}
