import 'package:flutter/material.dart';
import 'Clock/stopwatch.dart';
import 'Task manager/task manager.dart';

void main() {
  runApp(TodoListApp());
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StopwatchTimer(),
    );
  }
}

