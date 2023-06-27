import 'package:rxdart/rxdart.dart';

class NotificationsBloc {
  final _selectedValueController = BehaviorSubject<String>();
  final _currentQuestionIndexController = BehaviorSubject<int>();

  Stream<String> get selectedValueStream => _selectedValueController.stream;
  Stream<int> get currentQuestionIndexStream =>
      _currentQuestionIndexController.stream;

  Function(String) get setSelectedValue => _selectedValueController.sink.add;
  Function(int) get setCurrentQuestionIndex =>
      _currentQuestionIndexController.sink.add;

  NotificationsBloc() {
    setSelectedValue('Çoktan Seçmeli');
    setCurrentQuestionIndex(1);
  }

  void dispose() {
    _selectedValueController.close();
    _currentQuestionIndexController.close();
  }
}
