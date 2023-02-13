import 'package:flutter/material.dart';
import 'package:stopwatch/Moniter%20Counter/Examiner.dart';
import 'package:stopwatch/Moniter%20Counter/key_counter.dart';
import 'Clock/stopwatch.dart';
import 'Task manager/task manager.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Examiner(),
    );
  }
}

