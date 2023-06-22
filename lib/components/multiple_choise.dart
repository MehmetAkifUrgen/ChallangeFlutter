import 'package:flutter/material.dart';

class MultipleChoiceWidget extends StatefulWidget {
  const MultipleChoiceWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState();

  List<TextEditingController> getControllers() {
    return _MultipleChoiceWidgetState().controllers;
  }
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  List<String> choices = ['A', 'B', 'C', 'D'];
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  int selectedChoiceIndex = 0;

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var choice in choices)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: controllers[choices.indexOf(choice)].text.isEmpty
                            ? Colors.red
                            : Colors.transparent,
                      ),
                    ),
                    child: TextField(
                      controller: controllers[choices.indexOf(choice)],
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedChoiceIndex = choices.indexOf(choice);
                    });
                  },
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedChoiceIndex == choices.indexOf(choice)
                          ? Colors.green
                          : Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        selectedChoiceIndex == choices.indexOf(choice)
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
    );
  }
}
