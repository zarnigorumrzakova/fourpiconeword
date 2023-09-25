import 'dart:async';
import 'package:flutter/material.dart';

import 'common_images.dart';
import 'guessing_letter.dart';
import 'question.dart';
import 'letter_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;
  List<String> _guessingWord = [];
  List<String> _letters = [];
  bool _isIncorrect = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _guessingWord = List.filled(questions[i].word.length, '');
    _letters = List.from(questions[i].letters);
  }

  void _showFoundDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF152242),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'You found the word',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      i++;
                      _guessingWord = List.filled(questions[i].word.length, '');
                      _letters = List.from(questions[i].letters);
                    });
                    _timer?.cancel();
                  },
                  child: const Text(
                    'Go to next question',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goToNextQuestion(BuildContext context) async {
    if (i + 1 >= questions.length) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: const Color(0xFF152242),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'You reached end of the game!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'You are a WINNER!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: Colors.green),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        i = 0;
                        _guessingWord =
                            List.filled(questions[i].word.length, '');
                        _letters = List.from(questions[i].letters);
                        debugPrint('===> letters ${questions[i].word}');
                        debugPrint('===> letters ${questions[i].letters}');
                        _isIncorrect = false;
                      });
                    },
                    child: const Text(
                      'Replay',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
      return;
    } else {
      _showFoundDialog();
      _timer = Timer(
        const Duration(seconds: 2),
            () {
          Navigator.pop(context);
          setState(() {
            i++;
            _guessingWord = List.filled(questions[i].word.length, '');
            _letters = List.from(questions[i].letters);
          });
        },
      );
    }
  }

  void _checkWordFound(BuildContext context) {
    int count = 0;
    for (int j = 0; j < _guessingWord.length; j++) {
      if (_guessingWord[j].isNotEmpty) {
        count++;
      }
    }
    if (count != _guessingWord.length) {
      return;
    } else {
      if (_guessingWord.join() == questions[i].word) {
        _goToNextQuestion(context);
      } else {
        setState(() {
          _isIncorrect = true;
        });
      }
    }
  }

  void _addLetter(String letter, int letterIndex, BuildContext context) {
    if (_isIncorrect) {
      return;
    }
    setState(() {
      for (int j = 0; j < _guessingWord.length; j++) {
        if (_guessingWord[j].isEmpty) {
          _guessingWord[j] = letter;
          break;
        }
      }
      _letters[letterIndex] = '';
    });
    _checkWordFound(context);
  }

  void _removeLetter() {
    int lastLetterIndex = _guessingWord.length - 1;
    for (int j = _guessingWord.length - 1; j >= 0; j--) {
      if (_guessingWord[j].isNotEmpty) {
        lastLetterIndex = j;
        break;
      }
    }
    int firstEmptyIndex = -1;
    for (int j = 0; j < _letters.length; j++) {
      if (_letters[j].isEmpty) {
        firstEmptyIndex = j;
        break;
      }
    }
    setState(() {
      if (firstEmptyIndex >= 0) {
        _letters[firstEmptyIndex] = _guessingWord[lastLetterIndex];
      }
      _guessingWord[lastLetterIndex] = '';
      _isIncorrect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF152242),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              Text(
                'Question ${i + 1}/${questions.length}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonImage(image: questions[i].images[0]),
                  CommonImage(image: questions[i].images[1]),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonImage(image: questions[i].images[2]),
                  CommonImage(image: questions[i].images[3]),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questions[i].word.length,
                  itemBuilder: (context, index) {
                    return GuessingLetter(
                      letter: _guessingWord[index],
                      isIncorrect: _isIncorrect,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _letters.sublist(0, 6).length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return LetterItem(
                              letter: _letters.sublist(0, 6)[index],
                              onTap: () {
                                _addLetter(
                                  _letters.sublist(0, 6)[index],
                                  index,
                                  context,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _letters.sublist(6, 12).length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return LetterItem(
                              letter: _letters.sublist(6, 12)[index],
                              onTap: () {
                                _addLetter(
                                  _letters.sublist(6, 12)[index],
                                  index + 6,
                                  context,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _removeLetter();
                  },
                  child: Container(
                    height: 100,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}