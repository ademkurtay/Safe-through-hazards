import 'package:safe_through/data/styles.dart';
import 'package:safe_through/models/quiz.dart';
import 'package:safe_through/ui/screens/quiz/bloc/bloc.dart';
import 'package:safe_through/ui/screens/quiz/bloc/state.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:safe_through/ui/widgets/buttons/continue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/event.dart';

class QSGameView extends StatelessWidget {
  const QSGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizBloc>(
      builder: (context, bloc, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Quiz', style: TextStyle(fontSize: 17)),
          ),
          body: StreamBuilder<QuizGame>(
            stream: bloc.successStream,
            initialData: bloc.successState,
            builder: (context, snapshot) {
              QuizGame state = snapshot.data!;

              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(dCheckPadding),
                    child: Column(
                      children: [
                        _Line(currentQuestion: state.currentQuestion),
                        const SizedBox(height: dCheckPadding * 1.5),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    borderRadius: dCheckSmallRadius),
                                padding: EdgeInsets.all(dCheckPadding * 0.75),
                                child: Column(
                                  children: [
                                    Text(
                                      quizModels[state.currentQuestion - 1]
                                          .question,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              height: 1,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24,
                                              letterSpacing: -0.15),
                                    ),
                                    const SizedBox(height: dCheckPadding),
                                    Wrap(
                                      runSpacing: dCheckPadding / 2,
                                      children: List.generate(
                                        4,
                                        (index) {
                                          return _Item(
                                            isSelected:
                                                state.indexAnswer == index,
                                            index: index,
                                            question: quizModels[
                                                    state.currentQuestion - 1]
                                                .answer[index],
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Opacity(
                          opacity: state.indexAnswer == null ? 0.2 : 1,
                          child: DContinueButton(
                            onTap: () {
                              if (state.indexAnswer != null) {
                                bloc.sink.add(QuizConfirmAnswer());
                              }
                            },
                            name: 'Confirm',
                          ),
                        )
                      ],
                    ),
                  ),
                  if (state.isWrong != null)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: dCheckBackColor.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.all(dCheckPadding),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(dCheckPadding),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: dCheckSmallRadius,
                            ),
                            child: Builder(
                              builder: (context) {
                                if (state.isWrong == true) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Correct Answer!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: dCheckAccentColor,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                          height: dCheckLargePadding * 2),
                                      DContinueButton(
                                          onTap: () {
                                            bloc.sink.add(QuizNextQuestion());
                                          },
                                          name: 'Next Question')
                                    ],
                                  );
                                } else {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Wrong Answer!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: dCheckAccentColor,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                          height: dCheckLargePadding * 2),
                                      DContinueButton(
                                          onTap: () {
                                            bloc.sink
                                                .add(QuizCloseAnswerView());
                                          },
                                          name: 'Try Again'),
                                      const SizedBox(height: dCheckPadding / 2),
                                      DContinueButton(
                                          type: DContinueButtonColorType.white,
                                          onTap: () {
                                            bloc.sink.add(QuizNextQuestion());
                                          },
                                          name: 'Skip'),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        );
      },
    );
  }
}

List<String> letters = ['A', "B", 'C', 'D'];

class _Item extends StatelessWidget {
  final String question;
  final int index;
  final bool isSelected;

  const _Item(
      {super.key,
      required this.question,
      required this.index,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: () {
        if (!isSelected) {
          QuizBloc bloc = context.read<QuizBloc>();
          bloc.sink.add(QuizSelectAnswer(index));
        }
      },
      child: Container(
        padding: EdgeInsets.all(dCheckPadding * 0.75),
        decoration: BoxDecoration(
          borderRadius: dCheckSmallRadius,
          color: isSelected
              ? dCheckAccentColor
              : Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Color.fromRGBO(245, 245, 245, 1),
          ),
        ),
        child: Row(
          children: [
            Text(
              letters[index],
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color:
                    isSelected ? dCheckWhite : Color.fromRGBO(166, 166, 166, 1),
              ),
            ),
            const SizedBox(width: dCheckPadding * 0.75),
            Expanded(
                child: Text(
              question,
              style:
                  TextStyle(color: isSelected ? dCheckWhite : dCheckTextColor),
            ))
          ],
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  final int currentQuestion;

  const _Line({super.key, required this.currentQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: dCheckRadius,
      ),
      padding: EdgeInsets.symmetric(
          vertical: dCheckPadding / 4, horizontal: dCheckPadding / 2),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              style: TextStyle(
                  fontSize: 12,
                  height: 1.3,
                  color: Color.fromRGBO(166, 166, 166, 1),
                  fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                    text: '${currentQuestion.toString().padLeft(2, ' ')}',
                    style: TextStyle(
                      color: dCheckAccentColor,
                    )),
                TextSpan(text: '/20')
              ],
            ),
          ),
          const SizedBox(width: dCheckPadding / 2),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                20,
                (index) => Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index + 1 <= currentQuestion
                          ? dCheckAccentColor
                          : Color.fromRGBO(230, 230, 230, 1)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
