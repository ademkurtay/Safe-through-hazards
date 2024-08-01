abstract class QuizEvent {}

class QuizStartGame extends QuizEvent {
  final int? current;

  QuizStartGame({this.current});
}

class QuizConfirmAnswer extends QuizEvent {}

class QuizNextQuestion extends QuizEvent {}

class QuizCloseAnswerView extends QuizEvent {}

class QuizShowListEvent extends QuizEvent {}

class QuizSelectAnswer extends QuizEvent {
  final int index;

  QuizSelectAnswer(this.index);
}
