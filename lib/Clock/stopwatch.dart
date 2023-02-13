
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stopwatch/Clock/timer.dart';

class StopwatchTimer extends StatefulWidget {
  @override
  _StopwatchTimerState createState() => _StopwatchTimerState();
}

class _StopwatchTimerState extends State<StopwatchTimer> {
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  List<String> times = ["00", "00", "00"];

  updateTime(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {
        Duration duration = stopwatch.elapsed;
        times[0] = (duration.inHours).toString().padLeft(2, '0');
        times[1] = (duration.inMinutes % 60).toString().padLeft(2, '0');
        times[2] = (duration.inSeconds % 60).toString().padLeft(2, '0');
      });
    }
  }

  startStopwatch() {
    setState(() {
      if (stopwatch.isRunning) {
        stopwatch.stop();
      } else {
        stopwatch.start();
        timer = Timer.periodic(Duration(seconds: 1), updateTime);
      }
    });
  }

  resetStopwatch() {
    setState(() {
      stopwatch.reset();
      if (timer != null) {
        timer.cancel();
      }
      times = ["00", "00", "00"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  times[0],
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  times[1],
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  times[2],
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: startStopwatch,
                  child: Text(
                    stopwatch.isRunning ? 'Stop' : 'Start',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: resetStopwatch,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TimerWatch()
                      ),);
                  },
                  child: Text(
                    'Timer',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}