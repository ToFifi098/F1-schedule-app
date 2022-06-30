import 'package:flutter/material.dart';


import 'myAppBar.dart';
void main() => runApp(MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(),
        body: Scaffold(
          body: Text('dupa'),
        ),
      ),
    );
  }
}
