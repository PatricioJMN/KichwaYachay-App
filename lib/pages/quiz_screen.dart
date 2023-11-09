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
  int totalQuestions = 6;
  int totalOptions = 3;
  int questionIndex = 0;
  int progressIndex = 0;

  Quiz quiz = Quiz(name: "Lección", questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
        'assets/unity_${widget.unity}_lesson_${widget.lesson}.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];

    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data[option]['traduccion']);
      }

      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
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
    quiz.questions[questionIndex].selected = selected;
    if (selected == quiz.questions[questionIndex].answer) {
      quiz.questions[questionIndex].correct = true;
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
      backgroundColor: Constants.redtortaKY,
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
                      color: Constants.redtortaKY,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: Constants.redtortaKY,
                            margin: const EdgeInsets.all(15),
                            child: Text(
                                '${quiz.questions[questionIndex].question}\n${quiz.questions[questionIndex].questionK}',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                )),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalOptions,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Constants.yellowaguitaKY,
                                      Constants.yellowaguitaKY
                                    ]),
                                    border: Border.all(
                                        color: Constants.greenKY, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    leading: Text('${index + 1}',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    title: Center(
                                        child: Text(
                                            quiz.questions[questionIndex]
                                                .options[index],
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge)),
                                    subtitle: Image.asset(
                                      'assets/images/unity_${widget.unity}/lesson_${widget.lesson}/${quiz.questions[questionIndex].options[index]}.png',
                                      width: 75,
                                      height: 75,
                                    ),
                                    onTap: () {
                                      _optionSelected(quiz
                                          .questions[questionIndex]
                                          .options[index]);
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
            child:
                const Text('Omitir', style: TextStyle(color: Constants.redKY)),
          ),
        ],
      ),
    );
  }
}
