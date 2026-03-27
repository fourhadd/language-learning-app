import 'package:flutter/material.dart';
import 'package:language_learning_ui/core/constants/constants.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(
        color: Color.fromRGBO(202, 205, 219, 1),
      ),
      selectedIconTheme: IconThemeData(
        color: Constants.primaryColor,
      ),
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.calendar_today_outlined),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.edit_outlined),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.person_outline),
        ),
      ],
    );
  }
}
