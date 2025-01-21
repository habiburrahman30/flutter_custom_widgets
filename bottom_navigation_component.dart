import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/base.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: Base.navigationController.currentIndex.value,
        onTap: (index) {
          Base.navigationController.currentIndex.value = index;
        },
        selectedItemColor: Color(0xFF00BF6D),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
