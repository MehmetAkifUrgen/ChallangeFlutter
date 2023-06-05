import 'package:flutter/material.dart';
import '../constants.dart';

class OneOnePersonCard extends StatelessWidget {
  final String image;
  final String name;

  const OneOnePersonCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.screenWidth(context) / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortala
        crossAxisAlignment: CrossAxisAlignment.center, // Yatayda ortala
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: Constants.screenHeight(context) / 35,
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(color: Colors.orange),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
