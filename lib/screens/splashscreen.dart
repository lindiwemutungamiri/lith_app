import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_doctor.dart';
import 'patient_dashboard/fitness_app_home_screen.dart';
import 'sign_in_page.dart';
import 'welcome_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final auth = FirebaseAuth.instance;
  String nullCheckErrorMessage = "";

  checkLogin() async {
    try {
      user = auth.currentUser!;
    } catch (error) {
      nullCheckErrorMessage = error.toString();
      if (nullCheckErrorMessage == "Null check operator used on a null value") {
        Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const WelcomePage())));
      }
    }
    if (FirebaseAuth.instance.currentUser?.uid == null ||
        user.emailVerified == false) {
      // signed in
      Timer(
          const Duration(seconds: 1),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WelcomePage())));
    } else {
      //if (user.emailVerified) {
      Timer(const Duration(seconds: 1), () => userExistAuth());
      //}
    }
  }

  userExistAuth() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    late String role;
    var collection = FirebaseFirestore.instance.collection('userdata');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      var data = queryDocumentSnapshot.data();
      role = data['type'].toString();
    }
    if (pref.getString('login_as') == "doctor" || role.toString() == "doctor") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DoctorDashBoard()));
    } else if (pref.getString('login_as') == "patient" ||
        role.toString() == "patient") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const FitnessAppHomeScreen()));
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.white, Colors.white, Colors.white])),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                Image.asset("assets/images/LithLogo.jpg",
                    width: double.infinity, height: 300),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                )
              ])),
    );
  }
}
