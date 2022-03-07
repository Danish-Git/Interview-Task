import 'dart:async';

class TextBloc {

  // TextBloc._();
  // static final TextBloc _instance = TextBloc._();
  // factory TextBloc() => _instance;

  static TextBloc _instance = TextBloc._();
  TextBloc._();
  static TextBloc get instance => _instance;


  final _textController = StreamController<String>.broadcast();
  Stream<String> get textStream => _textController.stream;

  void textService(String text) {
    _textController.sink.add(text);
    // _textController.sink.done;
  }
}