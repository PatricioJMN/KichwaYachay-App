import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';

class LanguageSelector extends StatelessWidget {
  final bool isActive;
  final String language;
  final String imagePath;
  const LanguageSelector({Key? key, required this.isActive, required this.language, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        height: ScreenUtil().setHeight(83.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                imagePath,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                language,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(34, 40, 60, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Container(
                child: isActive
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Constants.primaryColor,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
