import 'package:rxdart/rxdart.dart';

class MultipleChoiceBloc {
  final _choicesController = BehaviorSubject<List<String>>();
  final _selectedChoiceIndexController = BehaviorSubject<int>();

  Stream<List<String>> get choicesStream => _choicesController.stream;
  Stream<int> get selectedChoiceIndexStream => _selectedChoiceIndexController.stream;

  Function(List<String>) get setChoices => _choicesController.sink.add;
  Function(int) get setSelectedChoiceIndex => _selectedChoiceIndexController.sink.add;

  MultipleChoiceBloc() {
    setChoices(['A', 'B', 'C', 'D']);
    setSelectedChoiceIndex(0);
  }

  void dispose() {
    _choicesController.close();
    _selectedChoiceIndexController.close();
  }
}
