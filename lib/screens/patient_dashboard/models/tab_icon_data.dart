import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/fitness_app/water.png',
      selectedImagePath: 'assets/fitness_app/water.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/train.png',
      selectedImagePath: 'assets/fitness_app/train.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/phoneCall.png',
      selectedImagePath: 'assets/fitness_app/phoneCall.png',
      index: 2,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/tab_3.png',
      selectedImagePath: 'assets/fitness_app/tab_3s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/jforty.png',
      selectedImagePath: 'assets/fitness_app/jforty.png',
      index: 4,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/tab_4.png',
      selectedImagePath: 'assets/fitness_app/tab_4s.png',
      index: 5,
      isSelected: false,
      animationController: null,
    ),
  ];
}
