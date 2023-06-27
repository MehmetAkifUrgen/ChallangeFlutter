import 'package:flutter/material.dart';

class MultipleChoiceWidget extends StatefulWidget {
  const MultipleChoiceWidget({Key? key});

  @override
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState();

  static void reset(BuildContext context) {
    final _MultipleChoiceWidgetState? state =
        context.findAncestorStateOfType<_MultipleChoiceWidgetState>();
    if (state != null) {
      state.reset();
      print("reset state");
    }
  }

  static bool areInputsEmpty(BuildContext context) {
    final _MultipleChoiceWidgetState? state =
        context.findAncestorStateOfType<_MultipleChoiceWidgetState>();
    if (state != null) {
      return state.inputsEmpty();
    }
    return false;
  }
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  List<String> choices = ['A', 'B', 'C', 'D'];
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  int selectedChoiceIndex = 0;

  void reset() {
    setState(() {
      for (var controller in controllers) {
        controller.clear();
      }
      selectedChoiceIndex = 0;
    });
  }

  bool inputsEmpty() {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        return true;
      }
    }
    return false;
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
