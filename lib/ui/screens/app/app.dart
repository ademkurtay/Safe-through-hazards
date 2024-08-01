import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../data/styles.dart';
import '../../widgets/buttons/click_area.dart';
import '../guide/screen.dart';
import '../hazard/screen.dart';
import '../kit/screen.dart';
import '../quiz/quiz.dart';
import '../settings/screen.dart';
import 'app_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<NavigatorBloc>(
        create: (context) => NavigatorBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        builder: (context, _) {
          NavigatorBloc bloc = context.read<NavigatorBloc>();
          return StreamBuilder<NavBarItem>(
              stream: bloc.itemStream,
              initialData: bloc.defaultItem,
              builder: (context, snapshot) {
                NavBarItem screenState = snapshot.data!;
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Column(
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (screenState == NavBarItem.hazard) {
                              return const HazardScreen();
                            } else if (screenState == NavBarItem.settings) {
                              return const SettingsScreen();
                            } else if (screenState == NavBarItem.safety) {
                              return const GuideScreen();
                            } else if (screenState == NavBarItem.kit) {
                              return const KitScreen();
                            } else if (screenState == NavBarItem.quiz) {
                              return const QuizScreen();
                            }

                            return const SizedBox();
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(0, -0.33),
                              )
                            ]),
                        padding: const EdgeInsets.symmetric(
                            horizontal: dCheckPadding,
                            vertical: dCheckPadding / 2),
                        child: SafeArea(
                          top: false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: NavBarItem.values
                                .map((e) =>
                                    _Item(item: e, isActive: screenState == e))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }
}

class _Item extends StatelessWidget {
  final NavBarItem item;
  final bool isActive;

  const _Item({Key? key, required this.item, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: () {
        if (!isActive) {
          NavigatorBloc bloc = context.read<NavigatorBloc>();
          bloc.pickItem(item);
        }
      },
      child: Column(
        children: [
          SvgPicture.asset(
            item.iconSrc,
            colorFilter: ColorFilter.mode(
                isActive
                    ? dCheckAccentColor
                    : const Color.fromRGBO(153, 153, 153, 1),
                BlendMode.srcIn),
          ),
          const SizedBox(height: dCheckPadding / 4),
          Text(
            item.fullName,
            style: TextStyle(
                fontSize: 10,
                color: isActive
                    ? dCheckAccentColor
                    : const Color.fromRGBO(153, 153, 153, 1)),
          ),
        ],
      ),
    );
  }
}
