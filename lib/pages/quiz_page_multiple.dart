import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_learning_ui/classes/question.dart';
import 'package:language_learning_ui/classes/quiz.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/results_page.dart';
import 'package:soundpool/soundpool.dart';

class QuizMultipleChoicePage extends StatefulWidget {
  const QuizMultipleChoicePage({
    Key? key,
    required this.unity,
    required this.lesson,
  }) : super(key: key);

  final String unity;
  final String lesson;

  @override
  State<QuizMultipleChoicePage> createState() => _QuizMultipleChoicePageState();
}

class _QuizMultipleChoicePageState extends State<QuizMultipleChoicePage> {
  int totalQuestions = 6;
  int totalOptions = 3;
  int questionIndex = 0;
  int progressIndex = 0;

  late String unity = widget.unity;
  late String lesson = widget.lesson;

  Quiz quiz = Quiz(name: '', questions: []);

  Future<void> readJson() async {
    quiz.name = 'Lección $lesson';
    final String response =
        // ignore: unnecessary_brace_in_string_interps
        await rootBundle.loadString('assets/unity${unity}Lesson$lesson.json');
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
        otherOptions.add(data[option]['traduction']);
      }

      QuestionMultipleChoice question =
          QuestionMultipleChoice.fromJson(data[answer]);
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

  Future<void> _soundButton() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle
        .load("assets/audio/unity1_red.wav")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
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
            constraints: const BoxConstraints(maxHeight: 450),
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
                                "${quiz.questions[questionIndex].question}\n\n${quiz.questions[questionIndex].questionK}",
                                textAlign: TextAlign.center,
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
                                    leading: IconButton(
                                      icon: const Icon(Icons.play_arrow),
                                      onPressed: () {
                                        _soundButton();
                                      },
                                    ),
                                    title: Center(
                                        child: Text(
                                            quiz.questions[questionIndex]
                                                .options[index],
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black))),
                                    subtitle: const Icon(Icons.abc),
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
