import 'package:safe_through/models/quiz.dart';
import 'package:safe_through/services/bloc/bloc.dart';
import 'package:safe_through/ui/screens/quiz/bloc/event.dart';
import 'package:safe_through/ui/screens/quiz/bloc/state.dart';

class QuizBloc extends DBloc<QuizState, QuizEvent, QuizGame> {
  final List<QuizHistory> history = [];

  @override
  void mapEventToState(QuizEvent event) {
    if (event is QuizStartGame) {
      newState(QuizGame(currentQuestion: event.current ?? 1));
    } else if (event is QuizSelectAnswer) {
      newSuccessState(successState.addAnswer(event.index));
    } else if (event is QuizConfirmAnswer) {
      bool isWrong =
          quizModels[successState.currentQuestion - 1].indexCurrentAnswer ==
              successState.indexAnswer;
      int indexHistory = history.indexWhere(
          (element) => element.numberQuestion == successState.currentQuestion);
      if (indexHistory == -1) {
        history.add(
          QuizHistory(
              isWrong: isWrong, numberQuestion: successState.currentQuestion),
        );
      } else {
        history[indexHistory] = QuizHistory(
            isWrong: isWrong, numberQuestion: successState.currentQuestion);
      }
      newSuccessState(successState.confirmAnswer(isWrong));
    } else if (event is QuizCloseAnswerView) {
      newSuccessState(successState.confirmAnswer(null));
    } else if (event is QuizNextQuestion) {
      if (successState.currentQuestion + 1 <= 20) {
        newSuccessState(successState.nextQuestion());
      } else {
        newState(QuizShowResult(
            history.where((element) => element.isWrong).toList().length));
      }
    } else if (event is QuizShowListEvent) {
      newState(QuizShowList());
    }
  }
}

class QuizHistory {
  final bool isWrong;
  final int numberQuestion;

  QuizHistory({required this.isWrong, required this.numberQuestion});
}
