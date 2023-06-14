// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants.dart';

class SweepStakeHead extends StatelessWidget {
  final String product;

  final String image;

  final String description;

  const SweepStakeHead({
    Key? key,
    required this.product,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Text(
              product,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            const Image(
              image: AssetImage("assets/flame.png"),
              width: 30,
            )
          ],
        ),
        Image(
          image: NetworkImage(image),
          width: Constants.screenWidth(context) * 4 / 5,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
