import 'package:flutter/material.dart';

int _keyPressCount = 0;
int _clickCount = 0;

class Examiner extends StatefulWidget {
  @override
  State<Examiner> createState() => _ExaminerState();
}

class _ExaminerState extends State<Examiner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GestureDetector(
        onTap: () {
          setState(() {
            _clickCount++;
            // print(_clickCount);
          });
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Key Counter',
                  ),
                  onChanged: (text) {
                    setState(() {
                      _keyPressCount++;
                    });
                  },
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  // width: 160,
                  color: Colors.blue,
                  child: Center(child: Text("Key Press Counts: ${_keyPressCount}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), ),
                ),
                Container(
                  height: 60,
                  // width: 160,
                  color: Colors.red,
                  child: Center(child: Text("Clicks Counts: ${_clickCount}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}