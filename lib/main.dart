import 'dart:convert';

import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web_scrap/Event.dart';

import 'myAppBar.dart';

void main() => runApp(MyWidget());

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

    var eventList_child = html
        .getElementsByClassName('event-list')[0]
        .children[0]
        .children[0]
        .children;

    for (int i = 1; i < eventList_child.length; i++) {
      eventList.add(Event(
          eventList_child[i].getElementsByClassName('card-title')[0].text,
          eventList_child[i].getElementsByClassName('start-date')[0].text,
          eventList_child[i].getElementsByClassName('end-date')[0].text,
          eventList_child[i].getElementsByClassName('month-wrapper')[0].text,
          eventList_child[i].getElementsByClassName('event-place')[0].text,
          eventList_child[i].getElementsByClassName('event-title')[0].text));
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
        appBar: MyAppBar(),
        body: isLoading
            ? const CircularProgressIndicator()
            : ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: eventList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(child: Text(eventList[index].title)),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
      ),
    );
  }
}
