// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TestInfo extends StatelessWidget {
  final IconData? icon;

  final String text;

  const TestInfo({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.red,
          size: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text)
      ],
    );
  }
}
