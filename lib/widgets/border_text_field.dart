import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final double borderRadius;

  const BorderTextField(
      {Key? key, required this.hintText,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.borderRadius = 8.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      width: double.infinity,
      height: ScreenUtil().setHeight(50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(169, 176, 185, 0.42),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(minWidth: 0.0),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(169, 176, 185, 1),
          ),
        ),
      ),
    );
  }
}
