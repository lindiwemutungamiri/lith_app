import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lith_app/screens/k_ten_scale/screens/quiz/quiz_screen.dart';

import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Center(
          child: Text(
            'The K10 Distress Scale',
            style: TextStyle(color: Colors.white),
          ),
        ),
        elevation: 1,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/icons/bgunsplash.jpeg", fit: BoxFit.fill),
          Column(
            children: [
              Image.asset("assets/icons/K_10_survey2.jpeg"),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  const SizedBox(
                    height: 30,
                  ), //2/6
                  Center(
                    child: Text(
                      "What is the The Kessler Psychological Distress Scale (K10)? ",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                      child: Text(
                          "The K10 is a simple measure of general distress without identifying its cause. It is a screening instrument to identify people in need of further assessment for anxiety and depression.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal))),
                  const Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(const QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Take the Test",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
