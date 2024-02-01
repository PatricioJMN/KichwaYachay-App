import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_learning_ui/classes/question.dart';
import 'package:language_learning_ui/classes/quiz.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/results_page.dart';

class QuizScreen extends StatefulWidget {
  final int unity;
  final String lesson;

  const QuizScreen({Key? key, required this.unity, required this.lesson})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int totalQuestions = 3;
  int totalOptions = 3;
  int questionIndex = 0;
  int progressIndex = 0;

  Quiz quiz = Quiz(name: "Lección", questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
        'assets/database/unity_${widget.unity}_lesson_${widget.lesson}.json');
    final List<dynamic> data = await json.decode(response);
    List<int> questionIndices = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];

    while (true) {
      questionIndices.shuffle();
      int questionIndex = questionIndices[0];
      if (questionsAdded.contains(questionIndex)) continue;
      questionsAdded.add(questionIndex);

      final questionData = data[questionIndex];
      String questionType = questionData['questionType'];
      late Question question;

      switch (questionType) {
        case 'multiple_choice':
          question = Question.fromJson(questionData);
          question.optionList.shuffle();
          // print(questionData);
          question.questionType = questionType;
          break;
        case 'drag_and_drop':
          // question = DragAndDropQuestion.fromJson(data[answer
          break;
        case 'question_sorting':
          // question = QuestionSorting.fromJson(data[answer
          break;
        default:
          throw ArgumentError('Invalid question type: $questionType');
      }

      quiz.questions.add(question);

      if (quiz.questions.length >= totalQuestions) break;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(String selected) {
    quiz.questions[questionIndex].selectedOption = selected;
    if (selected == quiz.questions[questionIndex].correctAnswer) {
      quiz.questions[questionIndex].isCorrect = true;
      quiz.right += 1;
    }

    progressIndex += 1;
    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }

    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Resultados', style: TextStyle(fontSize: 25.0)),
      backgroundColor: Constants.yellowaguitaKY,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preguntas totales: $totalQuestions',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Correctas: ${quiz.right}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Incorrectas: ${(totalQuestions - quiz.right)}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Porcentaje: ${quiz.percent}%',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => ResultsPage(
                        quiz: quiz,
                      ))),
            );
          },
          child: Text(
            'Ver Respuestas',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Constants.redKY,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                backgroundColor: Constants.grayKY,
                color: Constants.redKY,
                value: progressIndex / totalQuestions,
                minHeight: 20,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 550),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: quiz.questions.isNotEmpty
                  ? Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.all(15),
                            child: Text(
                                '${quiz.questions[questionIndex].questionSpanish}\n${quiz.questions[questionIndex].questionKichwa}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                )),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalOptions,
                              itemBuilder: (_, index) {
                                return Container(
                                  // height: 50,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Constants.orangeLisKY,
                                    border: Border.all(
                                        color: Constants.orangeLisKY, width: 0),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: ListTile(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    title: Center(
                                        child: Text(
                                            quiz.questions[questionIndex]
                                                .optionList[index],
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 15))),
                                    // IMAGE AFTER THE OPTION
                                    subtitle: Image.asset(
                                      'assets/images/unity_${widget.unity}/lesson_${widget.lesson}/${quiz.questions[questionIndex].optionList[index]}.png',
                                      width: 75,
                                      height: 75,
                                    ),
                                    onTap: () {
                                      _optionSelected(quiz
                                          .questions[questionIndex]
                                          .optionList[index]);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(
                      color: Constants.orangeKY,
                      backgroundColor: Constants.greenKY,
                    ),
            ),
          ),
          TextButton(
            onPressed: () {
              _optionSelected('Skipped');
            },
            child: const Text('Omitir',
                style: TextStyle(color: Constants.redKY, fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
