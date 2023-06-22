import 'package:deneme_p/components/multiple_choise.dart';
import 'package:flutter/material.dart';

import '../components/next_question.dart';
import '../components/one_vs_one.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String selectedValue = 'Çoktan Seçmeli';
  int currentQuestionIndex = 1;

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
                return SingleChildScrollView(
                  // Kaydırılabilir widget
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 235, 230, 230),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const OnevsOne(),

                          Text("$currentQuestionIndex. Soru tipini seçiniz"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              width: double.maxFinite,
                              child: Center(
                                child: DropdownButton<String>(
                                  value: selectedValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Çoktan Seçmeli',
                                    'Kelime bulmaca',
                                    'Boşluk Doldurma',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),

                          Column(
                            children: [
                              Text("$currentQuestionIndex. soruyu yaz"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Soruyu girin...',
                                    ),
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                              height: 20), // İsteğe bağlı boşluk ekleme

                          MultipleChoiceWidget(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              NextQuestion(
                                imagePath: 'assets/breadcrumb.png',
                                buttonText: "Sıradaki Soru",
                                onPressed: () {
                                  setState(() {
                                    // Tüm inputların sıfırlanması
                                    // Örneğin, MultipleChoiceWidget içindeki controllers listesini sıfırlayabilirsiniz

                                    // Soru indexinin güncellenmesi
                                    currentQuestionIndex++;
                                  });
                                },
                              ),
                            ],
                          ),
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
