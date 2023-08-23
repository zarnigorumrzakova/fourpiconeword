import 'package:flutter/material.dart';

class LetterItem extends StatelessWidget {
  final String letter;
  final Function() onTap;

  const LetterItem({super.key, required this.letter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: letter.isEmpty ? Colors.white.withOpacity(0.1) : Colors.white,
        ),
        child: Text(
          letter.toUpperCase(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}