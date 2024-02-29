// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
// import 'package:language_learning_ui/models/lesson_model.dart';
// import 'package:language_learning_ui/models/unity_model.dart';
// ignore: unused_import
import 'package:language_learning_ui/pages/quiz_home_page.dart';
import 'package:language_learning_ui/widgets/bottom_bar.dart';
import 'package:language_learning_ui/widgets/user_menu_bar.dart';
import 'package:language_learning_ui/widgets/lesson_card.dart';
// import 'package:language_learning_ui/MODELS/lesson_model.dart';

class LessonScreen extends StatefulWidget {
  final int unity;
  // final LessonModel lesson;
  const LessonScreen({Key? key, required this.unity}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LessonScreenState createState() => _LessonScreenState(unity: unity);
}

class _LessonScreenState extends State<LessonScreen> {
  final int unity;
  // final LessonModel lesson;
  _LessonScreenState({required this.unity});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 30.0,
                ),
                const UserMenuBar(),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: ScreenUtil().setHeight(180.0),
                  width: ScreenUtil().setWidth(339.24),
                  decoration: BoxDecoration(
                    color: Constants.topicsPrincipiante[unity - 1].color,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        Constants.topicsPrincipiante[unity - 1]
                                            .points,
                                        style: const TextStyle(
                                          color: Constants.primaryTextColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text(
                                    'Minutos',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                Constants.topicsPrincipiante[unity - 1].topic
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0,
                                ),
                              ),
                              Text(
                                Constants.topicsPrincipiante[unity - 1].time,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                Constants.topicsPrincipiante[unity - 1].image,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mis lecciones",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Constants.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Mostrar Todo",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Constants.captionTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Column(children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final lesson = Constants.lessons[index];
                      if (lesson.unityIndex == unity) {
                        return LessonCard(
                          lesson: lesson,
                          unity: unity,
                        );
                      } else {
                        return Container();
                      }
                    },
                    itemCount: Constants.lessons.length,
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
