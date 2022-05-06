import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lith_app/screens/patient_dashboard/doctor_appointment/constant.dart';
import 'package:url_launcher/url_launcher.dart';

//ignore: must_be_immutable

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

const _url = 'www.lithafrica.com';

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
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
      body: SingleChildScrollView(
        child: FutureBuilder(
            builder: (context, AsyncSnapshot<Uint8List?> snapshot) {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/lithTeam.png'),
                //image: AssetImage('assets/images/detail_illustration.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/back.svg',
                          height: 18,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/3dots.svg',
                        height: 18,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.24,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            (snapshot.data != null)
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        Image.memory(snapshot.data!).image,
                                  )
                                : Image.asset(
                                    'assets/images/LithIcon.jpeg',
                                    scale: 5,
                                  ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Lith Africa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: kTitleTextColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  child: const Text(
                                    'www.lithafrica.com',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                  ),
                                  onTap: () async => await canLaunch(
                                          'https://www.lithafrica.com')
                                      ? await launch(
                                          'https://www.lithafrica.com')
                                      : throw 'Something bad happened',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Contact the Team',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: kTitleTextColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'lindiwe.mutungamiri@ashesi.edu.gh +233 550 86 1693 \n \nJthompson@ashesi.edu.gh +1 (404) 914-3971 \n \n Email: lith.africa1@gmail.com\n \n Address: 1 University AvenueBerekuso, Eastern RegionGhana',
                          style: TextStyle(
                            height: 1.6,
                            color: kTitleTextColor.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
