import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatefulWidget {
  const CountdownTimerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  int minutes = 20;
  int seconds = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            minutes--;
            seconds = 59;
          } else {
            timer.cancel();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$minutes:${seconds.toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 24),
        ),
        const Icon(
          Icons.timer,
          color: Colors.red,
        )
      ],
    );
  }
}

// Kullanımı:

