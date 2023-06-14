// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:deneme_p/components/my_rich_text.dart';

class Sweepstake extends StatelessWidget {
  final String ownerPicture;
  final String ownerName;
  final String productPicture;
  final String productName;
  final String time;
  final String ownerRole;
  final String gun;
  final String saat;
  final String dakika;

  const Sweepstake({
    Key? key,
    required this.ownerPicture,
    required this.ownerName,
    required this.productPicture,
    required this.productName,
    required this.time,
    required this.ownerRole,
    required this.gun,
    required this.saat,
    required this.dakika,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(ownerPicture),
                      radius: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ownerName,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ownerRole,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
                const Image(
                  image: AssetImage('assets/home.png'),
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            Flexible(
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        image: NetworkImage(productPicture),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(productName),
                  ],
                ),
              ),
            ),
            MyRichText(gun: gun, saat: saat, dakika: dakika)
          ],
        ),
      ),
    );
  }
}
