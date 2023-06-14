// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String gun;
  final String saat;
  final String dakika;
  const MyRichText({
    Key? key,
    required this.gun,
    required this.saat,
    required this.dakika,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: gun,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
          const TextSpan(text: ' gün ', style: TextStyle(color: Colors.black)),
          TextSpan(
            text: saat,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
          const TextSpan(text: ' saat ', style: TextStyle(color: Colors.black)),
          TextSpan(
            text: dakika,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
          const TextSpan(
            text: ' dakika kaldı',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
