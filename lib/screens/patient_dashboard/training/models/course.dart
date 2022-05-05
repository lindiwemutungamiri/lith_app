import 'package:flutter/cupertino.dart';

class Course{
  final String imageUrl;
  final String name;
  final int time;
  final String students;
  final GestureTapCallback onTap;

  Course({required this.imageUrl,required this.name,required this.time,required this.students, required this.onTap});
}