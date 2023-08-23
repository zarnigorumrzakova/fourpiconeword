import 'package:flutter/material.dart';

class GuessingLetter extends StatelessWidget {
  final String letter;
  final bool isIncorrect;

  const GuessingLetter({
    super.key,
    required this.letter,
    this.isIncorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: isIncorrect ? Colors.red : Colors.transparent,
          width: 1,
        ),
        color: const Color(0xFF15182B),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        letter.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}