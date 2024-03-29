import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe, unused_import
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/models/lesson_model.dart';
// import 'package:language_learning_ui/models/unity_model.dart';
import 'package:language_learning_ui/pages/quiz_home_page.dart';

class LessonCard extends StatelessWidget {
  final LessonModel lesson;
  final int unity;
  const LessonCard({Key? key, required this.lesson, required this.unity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(6.0),
        width: double.infinity,
        height: ScreenUtil().setHeight(65.0),
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
        child: Row(
          children: [
            Container(
              height: ScreenUtil().setHeight(55.0),
              width: ScreenUtil().setWidth(55.0),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(224, 230, 255, 1),
              ),
              child: Image.asset(lesson.imagePath),
            ),
            const SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: const TextStyle(
                      color: Constants.primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    lesson.duration,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Constants.captionTextColor,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizHomePage(
                                unity: unity,
                                lesson: lesson.lessonIndex,
                              )));
                },
                child: const Text('Iniciar')),
            const SizedBox(
              width: 15.0,
            )
          ],
        ),
      ),
    );
  }
}
