import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'firebase_service.dart';
import 'locator.dart';

class StorageRepo {
  FirebaseStorage storage =
      FirebaseStorage.instanceFor(bucket: "gs://lith-55753.appspot.com");

  final FirebaseService _firebaseService = locator.get<FirebaseService>();

  Future<String> uploadFile(File file) async {
    var user = await _firebaseService.getUser();
    var storageRef = storage.ref().child("user/profile/${user.uid}");
    var uploadTask = storageRef.putFile(file);
    return (await uploadTask).ref.getDownloadURL();
  }

  Future<String> getUserProfileImageDownloadUrl(String uid) {
    var storageRef = storage.ref().child("user/profile/$uid");
    return storageRef.getDownloadURL();
  }
}
