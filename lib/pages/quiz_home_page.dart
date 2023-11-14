import 'package:flutter/material.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/quiz_screen.dart';
import 'package:language_learning_ui/pages/review_quiz_page.dart';

class QuizHomePage extends StatelessWidget {
  final int unity;
  final String lesson;
  const QuizHomePage({Key? key, required this.unity, required this.lesson})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.redKY,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 60, bottom: 40),
                child: Image.asset("assets/images/logo_kichwa_yachay.png")
                // const Icon(Icons.wb_sunny_outlined,
                //     size: 100,
                //     color: Color.fromRGBO(
                //         231, 106, 38, 1.0)), //Color del ícono de sol
                ),
            Card(
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Constants.redKY,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 25, left: 30, right: 30),
                    decoration: BoxDecoration(
                        border: Border.all(color: Constants.redKY),
                        color: Constants.redKY,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'LECCIÓN $lesson',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Constants.grayKY,
                            fontFamily: 'Roboto-Regular.ttf'),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                    unity: unity,
                                    lesson: lesson,
                                  )));
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Constants.orangeLisKY,
                      backgroundColor: Constants.orangeLisKY,
                      disabledBackgroundColor: Constants.orangeLisKY,
                      disabledForegroundColor: Constants.orangeLisKY,
                      elevation: 5,
                      side: const BorderSide(
                          width: 1, color: Constants.orangeLisKY),
                    ),
                    child: const Text(
                      'Iniciar Quiz',
                      style: TextStyle(color: Constants.grayKY),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewQuizPage(
                                    unity: unity,
                                    lesson: lesson,
                                  )));
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Constants.orangeLisKY,
                      backgroundColor: Constants.orangeLisKY,
                      disabledBackgroundColor: Constants.orangeLisKY,
                      disabledForegroundColor: Constants.orangeLisKY,
                      elevation: 5,
                      side: const BorderSide(
                          width: 1, color: Constants.orangeLisKY),
                    ),
                    child: const Text(
                      'Repasar Quiz',
                      style: TextStyle(color: Constants.grayKY),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
