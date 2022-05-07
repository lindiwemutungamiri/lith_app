import 'package:flutter/material.dart';

class DoctorVideoCallPage extends StatefulWidget {
  const DoctorVideoCallPage({Key? key}) : super(key: key);

  @override
  DoctorVideoCallState createState() => DoctorVideoCallState();
}

class DoctorVideoCallState extends State<DoctorVideoCallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patients Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
