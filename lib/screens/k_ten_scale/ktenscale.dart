import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lith_app/screens/k_ten_scale/screens/welcome/welcome_screen.dart';

class KTenScale extends StatelessWidget {
  const KTenScale({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
