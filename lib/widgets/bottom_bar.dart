import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: const IconThemeData(
        color: Color.fromRGBO(202, 205, 219, 1),
      ),
      selectedIconTheme: const IconThemeData(
        color: Constants.primaryColor,
      ),
      items: const [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.calendar_month,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.edit,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            Icons.supervised_user_circle,
          ),
        ),
      ],
    );
  }
}
