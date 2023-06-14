// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final Color color;

  const QuestionButton(
      {Key? key, required this.text, this.onPressed, this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
