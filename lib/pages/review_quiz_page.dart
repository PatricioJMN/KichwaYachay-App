import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_learning_ui/classes/question.dart';
import 'package:language_learning_ui/classes/quiz.dart';
import 'package:language_learning_ui/constants.dart';

class ReviewQuizPage extends StatefulWidget {
  final int unity;
  final String lesson;
  const ReviewQuizPage({Key? key, required this.unity, required this.lesson})
      : super(key: key);

  @override
  State<ReviewQuizPage> createState() => _ReviewQuizPageState();
}

class _ReviewQuizPageState extends State<ReviewQuizPage> {
  Quiz quiz = Quiz(name: 'Quiz', questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
        'assets/database/unity_${widget.unity}_lesson_${widget.lesson}.json');
    final List<dynamic> data = await json.decode(response);
    for (var item in data) {
      Question question = Question.fromJson(item);
      // question.question = question.question;
      quiz.questions.add(question);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Constants.redKY,
          elevation: 0,
        ),
        body: quiz.questions.isNotEmpty
            ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Constants.greenKY, width: 2),
                        color: Constants.greenaguitaKY),
                    child: Center(
                      child: Text(
                        "Preguntas: ${quiz.questions.length}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: quiz.questions.length,
                        itemBuilder: (_, index) {
                          return Card(
                            color: Constants.yellowaguitaKY,
                            child: ListTile(
                              leading: Text("${index + 1}"),
                              title:
                                  Text(quiz.questions[index].questionSpanish),
                              trailing: SizedBox(
                                  width: 100,
                                  child: Text(
                                      quiz.questions[index].correctAnswer)),
                            ),
                          );
                        }),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ));
  }
}
