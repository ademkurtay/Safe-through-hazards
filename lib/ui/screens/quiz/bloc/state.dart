abstract class QuizState {}

class QuizGame extends QuizState {
  final int currentQuestion;
  final int? indexAnswer;
  final bool? isWrong;
  // final int wrongAnswer;

  QuizGame nextQuestion() {
    return QuizGame(
      currentQuestion: currentQuestion + 1,
      // wrongAnswer: wrongAnswer,
    );
  }

  QuizGame addAnswer(int indexAnswer) {
    return QuizGame(
      currentQuestion: currentQuestion,
      indexAnswer: indexAnswer,
      // wrongAnswer: wrongAnswer,
    );
  }

  QuizGame confirmAnswer(bool? isWrong) {
    return QuizGame(
      currentQuestion: currentQuestion,
      indexAnswer: indexAnswer,
      isWrong: isWrong,
      // wrongAnswer: wrongAnswer + (isWrong == true ? 1 : 0),
    );
  }

  QuizGame({
    required this.currentQuestion,
    this.indexAnswer,
    this.isWrong,
    // required this.wrongAnswer,
  });
}

class QuizShowResult extends QuizState {
  final int wrongAnswers;

  QuizShowResult(this.wrongAnswers);
}


class QuizShowList extends QuizState {}
