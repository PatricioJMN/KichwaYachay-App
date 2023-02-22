import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/models/lesson_model.dart';
import 'package:language_learning_ui/pages/quiz_home_page.dart';
// ignore: unused_import
import 'package:language_learning_ui/pages/quiz_page_multiple.dart';
import 'package:language_learning_ui/widgets/bottom_bar.dart';
// ignore: unused_import
import 'package:language_learning_ui/widgets/lesson_card.dart';
import 'package:language_learning_ui/widgets/user_menu_bar.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  List<LessonModel> lessons = [
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Lección 01",
      duration: "25 minutos",
    ),
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Lección 02",
      duration: "13 minutos",
    ),
    LessonModel(
      imagePath: "assets/images/lesson.png",
      title: "Lección 03",
      duration: "45 minutos",
    ),
  ];
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
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(255, 99, 128, 0.6),
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
                                    child: const Center(
                                      child: Text(
                                        "20",
                                        style: TextStyle(
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
                                    "Puntaje",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                              ),
                              const Text(
                                "Unidad 1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0,
                                ),
                              ),
                              const Text(
                                "Contiene 3 Lecciones",
                                style: TextStyle(
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
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assets/images/course-1.png",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
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
                // Column(children: [
                //   ListView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder: (BuildContext context, int index) {
                //       return LessonCard(lesson: lessons[index]);
                //     },
                //     itemCount: lessons.length,
                //   ),
                //   ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const HomePage()));
                //     },
                //     child: const Text('Quiz'),
                //   )
                // ])
                SizedBox(
                  width: 362.8,
                  height: 305.7,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 5, 0),
                              child: Image.asset(
                                'assets/images/lesson.png',
                                width: 70.3,
                                height: 66.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text('Lección 1',
                                      style: TextStyle(
                                          color: Constants.primaryTextColor)),
                                ),
                                Text('Duración: 5 minutos',
                                    style: TextStyle(
                                        color: Constants.primaryColor)),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30, 0, 0, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const QuizHomePage(
                                                    unity: '1',
                                                    lesson: '1',
                                                  )));
                                    },
                                    child: const Text('Quiz'),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 5, 0),
                              child: Image.asset(
                                'assets/images/lesson.png',
                                width: 70.3,
                                height: 66.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text('Lección 2',
                                      style: TextStyle(
                                          color: Constants.primaryTextColor)),
                                ),
                                Text('Duración: 5 minutos',
                                    style: TextStyle(
                                        color: Constants.primaryColor)),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30, 0, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const QuizHomePage(
                                                  unity: '1',
                                                  lesson: '2',
                                                )));
                                  },
                                  child: const Text('Quiz'),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 5, 0),
                              child: Image.asset(
                                'assets/images/lesson.png',
                                height: 66.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text('Lección 3',
                                      style: TextStyle(
                                          color: Constants.primaryTextColor)),
                                ),
                                Text('Duración: 5 minutos',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Constants.primaryColor)),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30, 0, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const QuizHomePage(
                                                  unity: '1',
                                                  lesson: '3',
                                                )));
                                  },
                                  child: const Text('Quiz'),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
