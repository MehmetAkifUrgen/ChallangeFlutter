import 'package:deneme_p/components/test/head_test_owner.dart';
import 'package:deneme_p/components/test/question.dart';
import 'package:deneme_p/components/test/question_button.dart';
import 'package:deneme_p/components/test/timer.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 230, 230),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          HeadTestOwner(
                              image:
                                  "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg",
                              name: "Al Pacino",
                              job: "Aktör",
                              sweepstake: "Monster Abra A7"),
                          Question(question: "A- Scarface 1983"),
                          CountdownTimerWidget(),
                          QuestionButton(
                              text: "Sıradaki Soru", color: Colors.orange),
           
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
