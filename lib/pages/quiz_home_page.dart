import 'package:flutter/material.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/quiz_screen.dart';
import 'package:language_learning_ui/pages/review_quiz_page.dart';

class QuizHomePage extends StatelessWidget {
  final String unity;
  final String lesson;
  const QuizHomePage({Key? key, required this.unity, required this.lesson})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.yellowKY,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.redKY,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 30, bottom: 50),
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
                    margin: const EdgeInsets.only(top: 10, bottom: 25),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Constants.orangeKY, Constants.yellowKY]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Lección $lesson',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black),
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
                      foregroundColor: Colors.black,
                      backgroundColor: Constants.greenKY,
                      elevation: 4,
                      side: const BorderSide(width: 1),
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
                      foregroundColor: Colors.black,
                      backgroundColor: Constants.greenKY,
                      elevation: 4,
                      side: const BorderSide(width: 1),
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
