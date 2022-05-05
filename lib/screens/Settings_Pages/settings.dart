import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lith_app/screens/Doctor_Dashboard_Pages/edit_profile.dart';
import 'package:lith_app/screens/Settings_Pages/about_us.dart';
import 'package:lith_app/screens/Settings_Pages/help.dart';
import 'package:lith_app/screens/Settings_Pages/new_password.dart';
import 'package:lith_app/screens/Settings_Pages/profile.dart';
import 'package:lith_app/screens/patient_dashboard/fitness_app_home_screen.dart';
import 'package:lith_app/screens/sign_in_page.dart';
import 'package:lith_app/services/database.dart';
import 'package:lith_app/services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  final String role;
  const SettingsPage({Key? key, required this.role}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User? user = FirebaseAuth.instance.currentUser;
  Uint8List? dashBytes;
  @override
  void initState() {
    super.initState();
  }

  String name = "";

  @override
  Widget build(BuildContext context) {
    User activeuser = auth.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        elevation: 1,
        leading: IconButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            if (prefs.getString('login_as') == "doctor") {
              Navigator.of(context).pop();
            } else {
              if (widget.role == "doctor") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DoctorProfile()));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FitnessAppHomeScreen()));
              }
            }
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('userdata').snapshots(),
          builder: (context, snapshot) {
            var sn = snapshot.data;
            if (sn != null) {
              for (var element in sn.docs) {
                if (element.id == activeuser.uid) {
                  try {
                    name = element.get("name");
                  } catch (e) {
                    name = "";
                  }
                }
              }
            }
            return Container(
              padding: const EdgeInsets.only(left: 16, top: 6, right: 16),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "  Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FutureBuilder(
                          future: profilePic(),
                          builder: (context, snapshot) {
                            return Card(
                              color: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListTile(
                                  leading: Stack(
                                    children: <Widget>[
                                      (dashBytes != null)
                                          ? CircleAvatar(
                                              radius: 30.0,
                                              backgroundImage:
                                                  Image.memory(dashBytes!)
                                                      .image,
                                            )
                                          : const CircleAvatar(
                                              radius: 30.0,
                                              child: Icon(Icons.photo_camera),
                                            ),
                                      Positioned(
                                        bottom: 0.0,
                                        right: 1.0,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  subtitle: const Text(
                                    "Have a nice day :)",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  trailing: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    if (widget.role == "doctor") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DoctorProfile()));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PatientProfile()));
                                    }
                                    //open edit profile
                                  },
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 15,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ChangePassPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.cyan,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 15,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AboutUsPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About us",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.cyan,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 15,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const HelpPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Help",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.cyan,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 15,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () async {
                      FirebaseService service = FirebaseService();
                      await service.signOutFromGoogle();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SignInPage()),
                        ModalRoute.withName(''),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Log out",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Icon(
                            Icons.exit_to_app,
                            color: Colors.cyan,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 15,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () async {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    'Are you sure you want to delete your account?'),
                                content: SizedBox(
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          deleteUserData();
                                          user!.delete();
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const SignInPage()),
                                            ModalRoute.withName(''),
                                          );
                                          final FirebaseStorage
                                              firebaseStorage =
                                              FirebaseStorage.instanceFor(
                                                  bucket:
                                                      "gs://mental-health-e175a.appspot.com");
                                          await firebaseStorage
                                              .ref()
                                              .child(
                                                  "user/profile/${user!.uid}")
                                              .delete();
                                          Fluttertoast.showToast(
                                              msg: "Account Deleted",
                                              gravity: ToastGravity.TOP);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Center(
                                                child: Text('Yes'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.of(context).pop();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Center(
                                                child: Text('No'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delete Account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red[600],
                            ),
                          ),
                          const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 15,
                    thickness: 1,
                  ),
                ],
              ),
            );
          }),
    );
  }

  profilePic() async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(
        bucket: "gs://mental-health-e175a.appspot.com");
    await firebaseStorage
        .ref()
        .child("user/profile/${user!.uid}")
        .getData(100000000)
        .then((value) => {dashBytes = value!});
    return 1;
  }

  void deleteUserData() async {
    await DatabaseService(uid: user!.uid).deleteuser();
  }
}
