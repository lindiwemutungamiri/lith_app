import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/sign_in_page.dart';
import '../utils/constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.cyan.shade700,
          Colors.cyan.shade300,
          Colors.cyanAccent
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: SvgPicture.asset("assets/icons/medicare.svg",
                  width: double.infinity, height: 320),
            ),
            Column(
              children: [
                Image.asset("assets/images/LithLogo.jpg",
                    width: double.infinity, height: 10),
                const SizedBox(height: 10),
                const Text(
                  Constants.textIntroDesc1,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const GetStarted(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !isLoading
        ? SizedBox(
            width: size.width * 0.8,
            height: 50,
            child: OutlinedButton.icon(
              icon: Image.asset("assets/images/GetStarted2.png",
                  width: 30, height: 30),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                  Timer(
                      const Duration(milliseconds: 500),
                      () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage())));
                });
              },
              label: const Text(
                Constants.textStart,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shadowColor: Colors.blueGrey,
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            ),
          )
        : const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          );
  }
}
