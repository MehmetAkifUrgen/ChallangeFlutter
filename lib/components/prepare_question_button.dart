// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PrepareQuestionButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback? onPressed;
  const PrepareQuestionButton({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
