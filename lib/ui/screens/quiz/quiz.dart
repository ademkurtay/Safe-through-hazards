import 'package:auto_size_text/auto_size_text.dart';
import 'package:safe_through/data/assets.dart';
import 'package:safe_through/data/styles.dart';
import 'package:safe_through/ui/screens/quiz/bloc/bloc.dart';
import 'package:safe_through/ui/screens/quiz/bloc/state.dart';
import 'package:safe_through/ui/screens/quiz/views/game.dart';
import 'package:safe_through/ui/screens/quiz/views/result.dart';
import 'package:safe_through/ui/screens/quiz/views/welcome.dart';
import 'package:safe_through/ui/widgets/background.dart';
import 'package:safe_through/ui/widgets/buttons/continue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/list.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<QuizBloc>(
        create: (context) => QuizBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        builder: (context, _) {
          QuizBloc bloc = context.read<QuizBloc>();
          return StreamBuilder<QuizState>(
              stream: bloc.stream,
              initialData: bloc.screenState,
              builder: (context, snapshot) {
                QuizState? state = snapshot.data;

                if (state is QuizGame) {
                  return QSGameView();
                } else if (state is QuizShowResult) {
                  return QSShowResultView(currentAnswers: state.wrongAnswers);
                } else if (state is QuizShowList) {
                  return QSListView();
                }

                return QSWelcomeView();
              });
        });
  }
}
