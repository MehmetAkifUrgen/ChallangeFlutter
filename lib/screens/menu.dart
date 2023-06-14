import 'package:deneme_p/components/fireworks.dart';
import 'package:deneme_p/components/my_rich_text.dart';
import 'package:deneme_p/components/start_test_button.dart';
import 'package:deneme_p/components/sweepstake_head.dart';
import 'package:deneme_p/components/test_info.dart';
import 'package:deneme_p/constants.dart';
import 'package:flutter/material.dart';

import '../components/sweepstake_info.dart';

class Menu extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Menu({Key? key});

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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SweepStakeHead(
                            product: "Tulpar T7 V18.3.2 17,3",
                            image:
                                "https://www.monsternotebook.com.tr/UPLOAD/urun-gorselleri-yeni/TULPAR/T7_v18/thumb/01-T7_v18-2080_medium.png",
                            description:
                                "Monster Tulpar T7 V18.3.2 Intel Core i9-9900K 64GB 10 TB SSD RTX2080 17.3 inç Oyun Bilgisayarı"),
                        const SizedBox(
                          height: 20,
                        ),
                        const SweepStakeInfo(
                            name: "Enes Batur",
                            job: "Youtuber",
                            image:
                                "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg",
                            info:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: Constants.screenWidth(context) * 3 / 5,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TestInfo(
                                text: "20 Soru",
                                icon: Icons.question_mark_sharp,
                              ),
                              TestInfo(
                                  icon: Icons.watch_rounded, text: "20 Dakika"),
                              TestInfo(
                                  icon: Icons.done_all_rounded, text: "18/20")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StartTestButton(
                          text: "TESTE BAŞLA",
                          onPressed: () => print("asd"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const MyRichText(gun: "2", saat: "23", dakika: "44")
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
