import 'package:flutter/material.dart';
import 'package:lith_app/screens/patient_dashboard/training/components/Timer/timer.dart';

class Breathing extends StatefulWidget {
  const Breathing({Key? key}) : super(key: key);

  @override
  _BreathingState createState() => _BreathingState();
}

class _BreathingState extends State<Breathing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
        title: const Text("Breathing"),
      ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFF94DAE7),
              Color(0xFF45A9BA),
              Color(0xFF10758B)
            ],
            /*stops: [
        0,
        0.35,
        0.1
      ]*/
          )),
          child: const TimerPage()),
    );
  }
}
