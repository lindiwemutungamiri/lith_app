import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lith_app/screens/dashboard_doctor.dart';
import 'package:lith_app/services/database.dart';
import 'package:lith_app/services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/Settings_Pages/new_password.dart';
import '../screens/k_ten_scale/ktenscale.dart';

late User user;

// ignore: must_be_immutable
class GoogleSignIn extends StatefulWidget {
  String buttonText;
  GoogleSignIn({Key? key, required this.buttonText}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: 50,
      child: OutlinedButton.icon(
        icon:
            Image.asset("assets/images/google-logo.png", width: 30, height: 30),
        onPressed: () async {
          setState(() {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('Select Role As:'),
                      content: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('login_as', "patient");
                                FirebaseService service = FirebaseService();
                                try {
                                  await service.signInwithGoogle();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KTenScale()));
                                } catch (e) {
                                  if (e is FirebaseAuthException) {
                                    showMessage(e.message!);
                                  }
                                }
                                user = auth.currentUser!;
                                await DatabaseService(uid: user.uid)
                                    .updateUserData(
                                        user.displayName.toString(),
                                        user.displayName.toString(),
                                        user.email.toString(),
                                        "patient");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text('Patient'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('login_as', "doctor");
                                FirebaseService service = FirebaseService();
                                try {
                                  await service.signInwithGoogle();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DoctorDashBoard()));
                                } catch (e) {
                                  if (e is FirebaseAuthException) {
                                    showMessage(e.message!);
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text('Doctor'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
          });
        },
        label: Text(
          widget.buttonText,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.cyan.shade500,
            shadowColor: Colors.black45,
            elevation: 8,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)))),
      ),
    );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
