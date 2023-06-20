import 'package:deneme_p/constants.dart';
import 'package:flutter/material.dart';

class QuestionEndingScreen extends StatelessWidget {
  final String name;

  const QuestionEndingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var screenHeight = Constants.screenHeight(context);
    return Center(
      child: Column(
        children: [
          Image(
            width: Constants.screenWidth(context) / 4,
            image: AssetImage("assets/checked2.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "TEBRİKLER!",
            style: TextStyle(color: Colors.green),
          ),
          SizedBox(
            height: screenHeight / 30,
          ),
          const Text("Bütün soruları cevapladınız.",
              style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          Text(
            "$name cevapladıktan sonra kazanan belirlenecek.",
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
