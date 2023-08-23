import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  final String image;

  const CommonImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF29344F),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(10),
      width: 180,
      height: 180,
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}