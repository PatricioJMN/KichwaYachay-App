import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/constants.dart';

class UserMenuBar extends StatelessWidget {
  const UserMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
          radius: 25.0,
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(
          width: 15.0,
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Hola,\n",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(152, 156, 173, 1),
                ),
              ),
              TextSpan(
                text: "Patricio",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Constants.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Constants.primaryTextColor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
