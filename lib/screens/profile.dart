import 'package:deneme_p/components/fireworks.dart';
import 'package:deneme_p/components/one_vs_one.dart';
import 'package:flutter/material.dart';

import '../components/fill_char.dart';

class ProfilePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProfilePage({Key? key});

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
                final screenHeight = constraints.maxHeight;
                final screenWidth = constraints.maxWidth;

                return Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 230, 230),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    children: [
                      Fireworks(),
                      Padding(
                        padding: EdgeInsets.all(screenHeight / 25),
                        child: Hero(
                            tag: "profile_avatar",
                            child: CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg"),
                              radius: screenHeight / 15,
                            )),
                      ),
                      Text(
                        'Tony Montana',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: screenWidth / 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: screenHeight / 30),
                      const OnevsOne(),
                      SizedBox(height: screenHeight / 30),
                      const FillChar(),
                    ],
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
