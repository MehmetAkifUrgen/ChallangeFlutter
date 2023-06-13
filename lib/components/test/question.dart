// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  const Question({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 4 / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.redAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(question, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
