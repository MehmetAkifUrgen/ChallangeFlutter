// ignore: file_names
import 'package:deneme_p/components/next_question.dart';
import 'package:deneme_p/components/prepare_question_button.dart';
import 'package:flutter/material.dart';

import '../components/sweepstake.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
        ),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 230, 230),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Sweepstake(
                      ownerName: "Tony  Montana",
                      ownerPicture:
                          "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg",
                      productName: "Monster",
                      productPicture:
                          "https://yt3.googleusercontent.com/3ie-WUaP3rIXn0RqN16o4-S2eFXEba6nMyZlOA3Oe4Q0bhe444siImu1fbEA9Kn-qJy6jmY1fyI=s900-c-k-c0x00ffffff-no-rj",
                      time: "2 gün",
                      ownerRole: "Youtuber",
                    ),
                  ),
                  PrepareQuestionButton(
                      imagePath: 'assets/breadcrumb.png',
                      buttonText: 'Soruları Hazırla'),
                  SizedBox(
                    height: 10,
                  ),
                  NextQuestion(
                      imagePath: 'assets/breadcrumb.png',
                      buttonText: "Sıradaki Soru"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
