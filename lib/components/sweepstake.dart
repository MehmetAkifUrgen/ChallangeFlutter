import 'package:flutter/material.dart';

class Sweepstake extends StatelessWidget {
  final String ownerPicture;
  final String ownerName;
  final String productPicture;
  final String productName;
  final String time;
  final String ownerRole;
  const Sweepstake({
    Key? key,
    required this.ownerPicture,
    required this.ownerName,
    required this.productPicture,
    required this.productName,
    required this.ownerRole,
    required this.time,
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
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '2',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                  ),
                ),
                TextSpan(text: ' gün ', style: TextStyle(color: Colors.black)),
                TextSpan(
                  text: '14',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                  ),
                ),
                TextSpan(text: ' saat ', style: TextStyle(color: Colors.black)),
                TextSpan(
                  text: '26',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: ' dakika kaldı',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
