import 'package:flutter/material.dart';

class TranslationQuestion extends StatefulWidget {
  final Map<String, dynamic> questionData;

  const TranslationQuestion({Key? key, required this.questionData})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TranslationQuestionState createState() => _TranslationQuestionState();
}

class _TranslationQuestionState extends State<TranslationQuestion> {
  List<Widget> _shuffledWords = [];
  late Map<String, dynamic> _questionData;

  @override
  void initState() {
    super.initState();
    _questionData = widget.questionData;
    _buildShuffledWords();
  }

  void _buildShuffledWords() {
    _shuffledWords = [];
    final words = _questionData['words'] as List<dynamic>;
    final correctOrder = _questionData['correctOrder'] as List<dynamic>;

    List<String> shuffledWords = words.cast<String>().toList();
    shuffledWords.shuffle();

    for (final word in shuffledWords) {
      _shuffledWords.add(
        DragTarget<String>(
          builder: (context, accepted, rejected) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                word,
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
          onAccept: (acceptedWord) {
            if (acceptedWord == word &&
                // ignore: iterable_contains_unrelated_type
                !_shuffledWords.contains(acceptedWord)) {
              setState(() {
                // ignore: list_remove_unrelated_type
                _shuffledWords.remove(word);
                _shuffledWords.add(acceptedWord as Widget);
              });
            }
          },
          onWillAccept: (acceptedWord) {
            return true;
          },
        ),
      );
    }

    _shuffledWords.insertAll(
      0,
      correctOrder.map((index) => _shuffledWords[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _questionData['text'] ?? "",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: _shuffledWords,
        ),
      ],
    );
  }
}
