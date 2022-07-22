// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_scrap/Event.dart';
import 'package:web_scrap/myAppBar.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:web_scrap/race_completed.dart';

Event event = Event("", "", "", "", "", "", "", "", "");

String href = "";

class race_info extends StatefulWidget {
  race_info(Event ev, {Key? key}) : super(key: key) {
    event = ev;
    href = ev.href;
  }

  @override
  State<race_info> createState() => _race_infoState();
}

class _race_infoState extends State<race_info> {
  bool isLoading = true;

  void getData() async {
    final response = await http.Client().get(
      Uri.parse('https://www.formula1.com$href'),
    );

    dom.Document html = dom.Document.html(
        utf8.decode(latin1.encode(response.body), allowMalformed: true));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) getData();
    return Scaffold(
      appBar: const MyAppBar(),
      body: isLoading
          ? const CircularProgressIndicator()
          : event.status == "completed"
              ? RaceCompleted()
              : Text('notcompleted'),
    );
  }
}
