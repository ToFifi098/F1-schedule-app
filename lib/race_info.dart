import 'package:flutter/material.dart';
import 'package:web_scrap/myAppBar.dart';

String href = "";
class race_info extends StatefulWidget {
  
  race_info(String url, {Key? key}) : super(key: key){ 
    href = url;
  }
  
  @override
  State<race_info> createState() => _race_infoState();
}

class _race_infoState extends State<race_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const MyAppBar(),body: Text(href),);
  }
}