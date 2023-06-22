import 'package:deneme_p/components/award_selection_button.dart';
import 'package:deneme_p/components/fireworks.dart';
import 'package:deneme_p/components/one_vs_one.dart';
import 'package:flutter/material.dart';

import '../components/fill_char.dart';
import '../components/test/head_test_owner.dart';
import '../components/test/question.dart';
import '../components/test/question_button.dart';
import '../components/test/rules.dart';
import '../components/test/timer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedButton = 0;

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
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenHeight = constraints.maxHeight;
                final screenWidth = constraints.maxWidth;

                return SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 230, 230),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        // Fireworks(),
                        Padding(
                          padding: EdgeInsets.all(screenHeight / 25),
                          child: Hero(
                            tag: "profile_avatar",
                            child: CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg"),
                              radius: screenHeight / 15,
                            ),
                          ),
                        ),
                        Text(
                          'Tony Montana',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: screenWidth / 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight / 30),

                        SizedBox(height: screenHeight / 30),
                        const FillChar(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ödül Seçin:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      AwardSelectionButton(
                                        image_asset: "assets/flame.png",
                                        isSelected: _selectedButton == 0,
                                        onPressed: () {
                                          setState(() {
                                            _selectedButton = 0;
                                          });
                                        },
                                      ),
                                      AwardSelectionButton(
                                        image_asset: "assets/versus.png",
                                        isSelected: _selectedButton == 1,
                                        onPressed: () {
                                          setState(() {
                                            _selectedButton = 1;
                                          });
                                        },
                                      ),
                                      AwardSelectionButton(
                                        image_asset: "assets/shuttle.png",
                                        isSelected: _selectedButton == 2,
                                        onPressed: () {
                                          setState(() {
                                            _selectedButton = 2;
                                          });
                                        },
                                      ),
                                      AwardSelectionButton(
                                        image_asset: "assets/user.png",
                                        isSelected: _selectedButton == 3,
                                        onPressed: () {
                                          setState(() {
                                            _selectedButton = 3;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const HeadTestOwner(
                                      image:
                                          "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg",
                                      name: "Al Pacino",
                                      job: "Aktör",
                                      sweepstake: "Monster Abra A7"),
                                  const Question(question: "A- Scarface 1983"),
                                  const CountdownTimerWidget(),
                                  const QuestionButton(
                                      text: "Sıradaki Soru",
                                      color: Colors.orange),
                                  const Rules(
                                      image_info: "assets/flame.png",
                                      info: "20 soru",
                                      dakika: "34",
                                      saat: "3",
                                      gun: "2"),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
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
