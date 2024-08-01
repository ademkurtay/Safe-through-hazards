import 'package:safe_through/data/assets.dart';
import 'package:safe_through/models/quiz.dart';
import 'package:safe_through/ui/screens/quiz/bloc/bloc.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:safe_through/ui/widgets/buttons/continue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../data/styles.dart';
import '../bloc/event.dart';

class QSListView extends StatelessWidget {
  const QSListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 60,
              pinned: true,
              floating: true,
              stretch: true,
              backgroundColor: dCheckBackColor,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 2,
                titlePadding: EdgeInsets.all(dCheckPadding),
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Quiz',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(dCheckPadding),
                child: Column(
                  children: [
                    DContinueButton(
                        onTap: () {
                          QuizBloc bloc = context.read<QuizBloc>();
                          bloc.sink.add(QuizStartGame());
                        },
                        name: 'Play Quiz Again'),
                    const SizedBox(height: dCheckPadding * 1.5),
                    Wrap(
                      runSpacing: dCheckPadding / 2,
                      children: quizModels.map((e) => _Item(model: e)).toList(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final QuizModel model;

  const _Item({super.key, required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  late ValueNotifier<bool> showResult;

  @override
  void initState() {
    showResult = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    showResult.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showResult,
        builder: (context, value, _) {
          return ClickArea(
            onTap: () {
              QuizBloc bloc = context.read<QuizBloc>();
              bloc.sink.add(QuizStartGame(
                  current: quizModels.indexWhere((element) =>
                          element.question == widget.model.question) +
                      1));
              // showResult.value = !value;
            },
            child: Container(
              padding: EdgeInsets.all(dCheckPadding * 0.75),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: dCheckSmallRadius),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            (quizModels.indexOf(widget.model) + 1)
                                .toString()
                                .padRight(2, ' '),
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(166, 166, 166, 1),
                            ),
                          ),
                        ),
                        const SizedBox(width: dCheckPadding / 4),
                        Expanded(child: Text(widget.model.question)),
                        const SizedBox(width: dCheckPadding * 0.75),
                        Center(
                            child: SvgPicture.asset(DCheckIcons.chevronRight))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
