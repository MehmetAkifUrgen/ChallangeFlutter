// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:deneme_p/constants.dart';
import 'package:flutter/material.dart';

class HeadTestOwner extends StatelessWidget {
  final String image;

  final String name;

  final String job;

  final String sweepstake;

  const HeadTestOwner({
    Key? key,
    required this.image,
    required this.name,
    required this.job,
    required this.sweepstake,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.screenWidth(context) * 4 / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  radius: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      Text(job)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(sweepstake,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold)),
        )
      ]),
    );
  }
}
