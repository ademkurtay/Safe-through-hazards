import 'package:auto_size_text/auto_size_text.dart';
import 'package:safe_through/ui/screens/quiz/bloc/bloc.dart';
import 'package:safe_through/ui/screens/quiz/bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/assets.dart';
import '../../../../data/styles.dart';
import '../../../widgets/background.dart';
import '../../../widgets/buttons/continue.dart';

class QSWelcomeView extends StatelessWidget {
  const QSWelcomeView({super.key});

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
          DBackground(image: DCheckImages.quizBackground),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(dCheckPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    'Taking The Quiz',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.w700, height: 1),
                  ),
                  const SizedBox(height: dCheckPadding * 0.75),
                  AutoSizeText(
                      'It contains 20 questions so that you will remember exactly what to do when a volcano erupts',
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500, height: 1.2),
                      textAlign: TextAlign.center),
                  const SizedBox(height: dCheckLargePadding * 3),
                  DContinueButton(
                      onTap: () {
                        QuizBloc bloc = context.read<QuizBloc>();
                        bloc.sink.add(QuizStartGame());
                      },
                      name: 'Play Quiz'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
