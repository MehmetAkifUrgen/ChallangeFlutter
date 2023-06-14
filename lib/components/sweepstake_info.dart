// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:deneme_p/constants.dart';
import 'package:flutter/material.dart';

class SweepStakeInfo extends StatelessWidget {
  final String name;

  final String job;

  final String image;

  final String info;

  const SweepStakeInfo({
    Key? key,
    required this.name,
    required this.job,
    required this.image,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.screenWidth(context) * 4 / 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 25,
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.red, fontSize: 17),
              ),
              Text(job)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              info,
              textAlign: TextAlign.justify,
            ),
          ),
        )
      ]),
    );
  }
}
