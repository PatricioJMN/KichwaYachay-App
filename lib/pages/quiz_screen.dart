import 'package:flutter/material.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/models/question_model.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizScreen extends StatefulWidget {
  final int unity;
  final String lesson;
  final List<Question> questions;

  const QuizScreen({
    Key? key,
    required this.unity,
    required this.lesson,
    required this.questions,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int _questionIndex = 0;
  late Question _currentQuestion;
  List<bool> _selectedOptions = [];
  // Multiple Option Variables
  int _selectedMultipleChoice = -1;
  // Trasnlate Variables
  List<bool> _selectedTranslate = [];
  // Audio Player
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _currentQuestion = widget.questions[_questionIndex];
    _selectedOptions =
        List.generate(_currentQuestion.optionList.length, (index) => false);
  }

  List<Column> _buildMultipleChoice(
      List<String> options, Function(int?) onChanged) {
    return options.asMap().entries.map((entry) {
      return Column(
        children: [
          RadioListTile<int>(
            title: Text(
              options[entry.key],
              style: const TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            value: entry.key,
            groupValue: _selectedMultipleChoice,
            onChanged: (int? value) {
              setState(() {
                _selectedMultipleChoice = value!;
              });
              onChanged(value);
            },
          ),
          const Divider(height: 16),
        ],
      );
    }).toList();
  }

  List<Widget> _buildSort(
      List<String> shuffledWords, List<String> correctWords) {
    // Initialize _selectedWords with all false values if it's not initialized yet
    if (_selectedTranslate.length != shuffledWords.length) {
      _selectedTranslate =
          List.generate(shuffledWords.length, (index) => false);
    }
    return [
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Selecciona las palabras correctas:',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(
        height: 10,
      ),
      ...shuffledWords.asMap().entries.map((entry) {
        return CheckboxListTile(
          title: Text(shuffledWords[entry.key]),
          value: _selectedTranslate[entry.key],
          onChanged: (value) {
            setState(() {
              _selectedTranslate[entry.key] = value!;
            });
          },
        );
      }).toList(),
    ];
  }

  // Escuchar y Traducir
  List<Widget> _buildListenAndTranslate(
      String question, List<String> options, Function(int?) onChanged) {
    return [
      Column(
        children: [
          // Text(
          //   _currentQuestion.questionSpanish,
          //   style: const TextStyle(color: Colors.black, fontSize: 20),
          //   textAlign: TextAlign.center,
          // ),
          // const SizedBox(height: 0),
          InkWell(
            onTap: () async {
              await player.play(AssetSource(
                  'audios/unity_${widget.unity}/lesson_${widget.lesson}/${_currentQuestion.audioPath}'));
            },
            child: const Icon(
              Icons.play_circle_fill_outlined,
              size: 60,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          ...options.asMap().entries.map((entry) {
            return Column(
              children: [
                RadioListTile<int>(
                  title: Text(
                    options[entry.key],
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  value: entry.key,
                  groupValue: _selectedMultipleChoice,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedMultipleChoice = value!;
                    });
                    onChanged(value);
                  },
                ),
                const Divider(height: 16),
              ],
            );
          }).toList(),
        ],
      ),
    ];
  }

  // Drag and Drop
  List<Widget> _buildMatch(List<String> words, List<String> linkedWords) {
    return [
      const SizedBox(height: 20),
      const Text(
        'Une las palabras correctamente:',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 20),
      Wrap(
        children: List<Widget>.generate(words.length, (index) {
          return DragTarget<String>(
            builder: (
              BuildContext context,
              List<String?> candidateData,
              List<dynamic> rejectedData,
            ) {
              return Container(
                key: Key(words[index]),
                width: 100,
                height: 100,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(words[index]),
              );
            },
            onAccept: (data) {
              if (data == linkedWords[index]) {
                setState(() {});
              }
            },
          );
        }).toList(),
      ),
    ];
  }

  // Ordenar verticalmente arrastrando
  // List<Widget> _buildSort(List<String> words) {
  //   return [
  //     const SizedBox(
  //       height: 20,
  //     ),
  //     const Text(
  //       'Ordena las palabras correctamente:',
  //       textAlign: TextAlign.center,
  //       style: TextStyle(fontSize: 16),
  //     ),
  //     const SizedBox(
  //       height: 20,
  //     ),
  //     ReorderableListView(
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       children: words.asMap().entries.map((entry) {
  //         return ListTile(
  //           key: Key(entry.key.toString()),
  //           title: Text(words[entry.key]),
  //           trailing: ReorderableDragStartListener(
  //             index: entry.key,
  //             child: Icon(Icons.drag_handle),
  //           ),
  //         );
  //       }).toList(),
  //       onReorder: (int oldIndex, int newIndex) {
  //         setState(() {
  //           if (newIndex > oldIndex) {
  //             newIndex -= 1;
  //           }
  //           final String item = words.removeAt(oldIndex);
  //           words.insert(newIndex, item);
  //         });
  //       },
  //     ),
  //   ];
  // }

  bool _listEquals(List<bool> list1, List<String> list2) {
    int count = 0;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i].toString() == list2[i]) {
        count++;
      }
    }
    return count == list1.length;
  }

  // Function to check weather the answer is correct or not
  // Points will be added according to the number of correct answers
  // NOTE: Replace the print statements to another function which can take count of the punctuation
  void _checkAnswer() {
    // Multiple Choice Handler
    if (_currentQuestion.questionType == 'multiple_choice') {
      int correctOptionIndex =
          _currentQuestion.optionList.indexOf(_currentQuestion.correctAnswer);
      if (_selectedMultipleChoice == correctOptionIndex) {
        print('Respuesta correcta');
      } else {
        print('Respuesta incorrecta');
      }
      // Translate Handler
    } else if (_currentQuestion.questionType == 'translate') {
      bool isCorrect = false;
      // print("Selected: $_selectedTranslate");
      // print("Correct: ${_currentQuestion.correctOrder}");
      if (_listEquals(_selectedTranslate, _currentQuestion.correctOrder)) {
        isCorrect = true;
      }
      if (isCorrect) {
        print('Respuesta correcta');
      } else {
        print('Respuesta incorrecta');
      }
    } else if (_currentQuestion.questionType == 'listen_and_translate') {
      int correctOptionIndex =
          _currentQuestion.optionList.indexOf(_currentQuestion.correctAnswer);
      if (_selectedMultipleChoice == correctOptionIndex) {
        print('Respuesta correcta');
      } else {
        print('Respuesta incorrecta');
      }
    }

    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      if (_questionIndex < widget.questions.length) {
        _currentQuestion = widget.questions[_questionIndex];
        _selectedOptions =
            List.generate(_currentQuestion.optionList.length, (index) => false);
      } else {
        // Agregar alguna lógica adicional cuando se han recorrido todas las preguntas
        print('Se han recorrido todas las preguntas');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lección ${widget.lesson}'),
        backgroundColor: Constants.redKY,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              _currentQuestion.questionSpanish,
              style: const TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            // Asegurarse de que la pregunta no esté vacía
            if (_currentQuestion.questionKichwa.isNotEmpty)
              Text(
                _currentQuestion.questionKichwa,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            // Carga la rutina de opción multiple
            if (_currentQuestion.questionType == 'multiple_choice')
              ..._buildMultipleChoice(_currentQuestion.optionList, (value) {
                setState(() {
                  _selectedOptions[_selectedMultipleChoice] =
                      value == _currentQuestion.correctAnswer;
                });
              }),
            // Carga la rutina de traducir
            if (_currentQuestion.questionType == 'translate')
              ..._buildSort(
                  _currentQuestion.words, _currentQuestion.correctOrder),
            // Carga la rutina de escuchar y traducir
            if (_currentQuestion.questionType == 'listen_and_translate')
              ..._buildListenAndTranslate(
                  _currentQuestion.questionSpanish, _currentQuestion.optionList,
                  (value) {
                setState(() {
                  _selectedOptions[_selectedMultipleChoice] =
                      value == _currentQuestion.correctAnswer;
                });
              }),
            // Carga la rutina de Drag and Drop
            if (_currentQuestion.questionType == 'drag_and_drop')
              ..._buildMatch(
                  _currentQuestion.words, _currentQuestion.optionList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkAnswer,
        child: const Icon(Icons.check),
      ),
    );
  }
}
