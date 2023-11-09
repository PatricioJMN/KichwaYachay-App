import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 5.0),
              height: ScreenUtil().setHeight(36.0),
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(59, 89, 153, 1),
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(169, 176, 185, 0.42),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  Text(
                    "Facebook",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 5.0),
              height: ScreenUtil().setHeight(36.0),
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(169, 176, 185, 0.42),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/google.svg",
                    width: 15.0,
                  ),
                  const Text(
                    " Gmail",
                    style: TextStyle(
                      color: Color.fromRGBO(35, 38, 43, 1),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
