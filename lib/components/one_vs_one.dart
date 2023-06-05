import 'package:deneme_p/constants.dart';
import 'package:deneme_p/components/one_one.dart';
import 'package:flutter/material.dart';

class OnevsOne extends StatelessWidget {
  const OnevsOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const OneOnePersonCard(
                    image:
                        "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg",
                    name: "Tony Montana"),
                Image(
                  image: const AssetImage("assets/versus.png"),
                  width: Constants.screenWidth(context) / 7,
                ),
                const OneOnePersonCard(
                    image:
                        "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg",
                    name: "Scarface")
              ]),
        ),
      ),
    );
  }
}
