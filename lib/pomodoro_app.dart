import 'package:flutter/material.dart';
import 'widget/pomodoro_timer.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroTimer(),
      theme: ThemeData.light(),
    );
  }
}
