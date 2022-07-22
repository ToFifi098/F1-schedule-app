import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RaceCompleted extends StatefulWidget {
  const RaceCompleted({Key? key}) : super(key: key);

  @override
  State<RaceCompleted> createState() => _RaceCompletedState();
}

class _RaceCompletedState extends State<RaceCompleted> {
  @override
  Widget build(BuildContext context) {
    return Text('completed');
  }
}