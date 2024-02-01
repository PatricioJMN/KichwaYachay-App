import 'package:flutter/material.dart';
import 'package:language_learning_ui/classes/quiz.dart';
import 'package:language_learning_ui/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.quiz}) : super(key: key);
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Constants.redKY,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin:
                  const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Constants.greenKY,
                  width: 5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Preguntas: ${quiz.questions.length}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Correctas: ${quiz.percent}%',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: quiz.questions.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: quiz.questions[index].isCorrect
                          ? Colors.green.shade200
                          : Colors.red.shade200,
                      child: ListTile(
                        leading: quiz.questions[index].isCorrect
                            ? Icon(Icons.check, color: Colors.green.shade900)
                            : Icon(Icons.close, color: Colors.red.shade900),
                        title: Text(
                          quiz.questions[index].questionSpanish,
                        ),
                        subtitle: Text(quiz.questions[index].selectedOption),
                        trailing: SizedBox(
                          width: 100,
                          child: Text(
                            quiz.questions[index].correctAnswer,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
