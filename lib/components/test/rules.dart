// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../my_rich_text.dart';

class Rules extends StatelessWidget {
  final String image_info;

  final String info;

  final String dakika;

  final String saat;

  final String gun;

  const Rules(
      {super.key,
      required this.image_info,
      required this.info,
      required this.dakika,
      required this.saat,
      required this.gun});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Kurallar:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RulesInfoItem(image_info: image_info, info: info),
                  RulesInfoItem(image_info: image_info, info: info),
                  RulesInfoItem(image_info: image_info, info: info)
                ],
              ),
            ),
            Center(
              child: Column(children: [
                MyRichText(gun: gun, saat: saat, dakika: dakika),
                const Text("dakika geçerli olacak")
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

class RulesInfoItem extends StatelessWidget {
  const RulesInfoItem({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.image_info,
    required this.info,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  final String image_info;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(image_info),
          width: 48,
        ),
        Text(info)
      ],
    );
  }
}
