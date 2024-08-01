import 'package:auto_size_text/auto_size_text.dart';
import 'package:safe_through/ui/screens/quiz/bloc/bloc.dart';
import 'package:safe_through/ui/widgets/buttons/continue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/assets.dart';
import '../../../../data/styles.dart';
import '../../../widgets/background.dart';
import '../bloc/event.dart';

class QSShowResultView extends StatelessWidget {
  final int currentAnswers;

  const QSShowResultView({super.key, required this.currentAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz', style: TextStyle(fontSize: 17)),
      ),
      body: Stack(
        children: [
          DBackground(image: DCheckImages.quizResultBackground),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(dCheckPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    'Congratulations!',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.w700, height: 1),
                  ),
                  const SizedBox(height: dCheckPadding * 0.75),
                  AutoSizeText(
                      'You passed the quiz with an ${currentAnswers}'
                      ' out of 20! Take care of yourself and your '
                      'loved ones, inform your friends and '
                      'acquaintances',
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.2),
                      textAlign: TextAlign.center),
                  const SizedBox(height: dCheckLargePadding * 3),
                  DContinueButton(
                      onTap: () {
                        QuizBloc bloc = context.read<QuizBloc>();
                        bloc.sink.add(QuizShowListEvent());
                      },
                      name: 'Great!')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
