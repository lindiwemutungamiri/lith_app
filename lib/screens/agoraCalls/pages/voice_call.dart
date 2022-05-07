import 'package:flutter/material.dart';

class VoiceCallPage extends StatefulWidget {
  const VoiceCallPage({Key? key}) : super(key: key);

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

// App state class
class _VoiceCallPageState extends State<VoiceCallPage> {
  @override
  void initState() {
    super.initState();
  }

  //Build chat UI
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Wellness Service Providers \n Audio calling  coming soon!",
        ),
      ),
    );
  }
}
