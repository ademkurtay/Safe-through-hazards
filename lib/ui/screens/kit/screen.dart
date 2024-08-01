import 'package:safe_through/data/styles.dart';
import 'package:safe_through/ui/screens/kit/views/basic.dart';
import 'package:safe_through/ui/screens/kit/views/introduction.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:flutter/material.dart';

class KitScreen extends StatefulWidget {
  const KitScreen({super.key});

  @override
  State<KitScreen> createState() => _KitScreenState();
}

enum _Type { introduction, basic, additional }

class _KitScreenState extends State<KitScreen> {
  late ValueNotifier<_Type> typeScreen;

  @override
  void initState() {
    typeScreen = ValueNotifier(_Type.introduction);
    super.initState();
  }

  @override
  void dispose() {
    typeScreen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 110,
              pinned: true,
              floating: true,
              stretch: true,
              backgroundColor: dCheckBackColor,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 2,
                titlePadding: EdgeInsets.all(dCheckPadding),
                title: Text(
                  'Emergency '
                  'Kit Checklist',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TapBar(typeScreen: typeScreen),
                  Padding(
                    padding:
                        const EdgeInsets.all(dCheckPadding).copyWith(top: 0),
                    child: ValueListenableBuilder(
                      valueListenable: typeScreen,
                      builder: (context, value, _) {
                        if (value == _Type.introduction) {
                          return KSIntroductionView();
                        } else if (value == _Type.basic) {
                          return KSBasicView();
                        }
                        return KSAdditionalView();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TapBar extends StatelessWidget {
  final ValueNotifier<_Type> typeScreen;

  const _TapBar({super.key, required this.typeScreen});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(dCheckPadding),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.all(2),
        child: ValueListenableBuilder(
            valueListenable: typeScreen,
            builder: (context, value, _) {
              return Row(
                children: [
                  ClickArea(
                    onTap: () {
                      if (value != _Type.introduction) {
                        typeScreen.value = _Type.introduction;
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: dCheckLargePadding,
                          vertical: dCheckPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: value == _Type.introduction
                            ? dCheckAccentColor
                            : Theme.of(context).colorScheme.surface,
                      ),
                      child: Text(
                        'Introduction',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: value == _Type.introduction
                                ? dCheckWhite
                                : dCheckAccentColor),
                      ),
                    ),
                  ),
                  ClickArea(
                    onTap: () {
                      if (value != _Type.basic) {
                        typeScreen.value = _Type.basic;
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: dCheckLargePadding,
                          vertical: dCheckPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: value == _Type.basic
                            ? dCheckAccentColor
                            : Theme.of(context).colorScheme.surface,
                      ),
                      child: Text(
                        'Basic Disaster Supplies Kit',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: value == _Type.basic
                                ? dCheckWhite
                                : dCheckAccentColor),
                      ),
                    ),
                  ),
                  ClickArea(
                    onTap: () {
                      if (value != _Type.additional) {
                        typeScreen.value = _Type.additional;
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: dCheckLargePadding,
                          vertical: dCheckPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: value == _Type.additional
                            ? dCheckAccentColor
                            : Theme.of(context).colorScheme.surface,
                      ),
                      child: Text(
                        'Additional Emergency Supplies',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: value == _Type.additional
                                ? dCheckWhite
                                : dCheckAccentColor),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
