import 'dart:async';
import 'package:flutter/material.dart';

class TimerWatch extends StatefulWidget {
  @override
  _TimerWatchState createState() => _TimerWatchState();
}

class _TimerWatchState extends State<TimerWatch> {
  late Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            },),
            Text('Timer Watch'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_start'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _start = 10;
                  });
                  startTimer();
                },
                child: Text('Start'),
              ),
            )
          ],
        ),
      ),
    );
  }
}