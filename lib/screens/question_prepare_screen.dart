import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/next_question.dart';
import '../components/one_vs_one.dart';

class QuestionPrepareScreen extends StatefulWidget {
  const QuestionPrepareScreen({Key? key});

  @override
  State<QuestionPrepareScreen> createState() => _QuestionPrepareScreenState();
}

class _QuestionPrepareScreenState extends State<QuestionPrepareScreen> {
  String selectedValue = 'Çoktan Seçmeli';
  int currentQuestionIndex = 1;
  List<String> choices = ['A', 'B', 'C', 'D'];
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  int selectedChoiceIndex = 0;
  TextEditingController question_controller = TextEditingController();

  bool isFieldEmpty = true;

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  void validateInput() {
    bool isEmpty = false;
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        isEmpty = true;
        break;
      }
    }
    setState(() {
      isFieldEmpty = isEmpty;
    });
  }

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
                                    border: Border.all(
                                      color: isFieldEmpty
                                          ? Colors.transparent
                                          : Colors.red,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: question_controller,
                                    onChanged: (text) {
                                      validateInput();
                                    },
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      border: InputBorder.none,
                                      hintText: 'Soruyu girin...',
                                    ),
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var choice in choices)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${choice}-',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: TextField(
                                            controller: controllers[
                                                choices.indexOf(choice)],
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedChoiceIndex =
                                                choices.indexOf(choice);
                                          });
                                        },
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: selectedChoiceIndex ==
                                                    choices.indexOf(choice)
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                          child: Center(
                                            child: Text(
                                              selectedChoiceIndex ==
                                                      choices.indexOf(choice)
                                                  ? 'D'
                                                  : 'Y',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              NextQuestion(
                                imagePath: 'assets/breadcrumb.png',
                                buttonText: "Sıradaki Soru",
                                onPressed: () {
                                  validateInput();
                                  if (isFieldEmpty) {
                                    showToastMessage('Inputlar boş olamaz!');
                                  } else {
                                    setState(() {
                                      currentQuestionIndex++;
                                      for (var controller in controllers) {
                                        controller.clear();
                                      }
                                      question_controller.clear();
                                      selectedChoiceIndex = 0;
                                    });
                                  }
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
