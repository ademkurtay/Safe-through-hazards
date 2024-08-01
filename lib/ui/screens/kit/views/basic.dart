import 'package:apphud/apphud.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:safe_through/data/assets.dart';
import 'package:safe_through/data/styles.dart';
import 'package:safe_through/main.dart';
import 'package:safe_through/ui/screens/premium/screen.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../../../models/checklist.dart';
import '../../../widgets/buttons/continue.dart';

class KSBasicView extends StatelessWidget {
  const KSBasicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: dCheckPadding / 2,
      children: kitBasicCheckList.map((e) => _Item(model: e)).toList(),
    );
  }
}

class KSAdditionalView extends StatelessWidget {
  const KSAdditionalView({super.key});

  @override
  Widget build(BuildContext context) {
    // if (!appController.isPremium) {
    return ValueListenableBuilder(
        valueListenable: safeThroughSubActive,
        builder: (context, isSubActive, widget) {
          if (!isSubActive) {
            return Container(
              padding: EdgeInsets.all(dCheckPadding),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: dCheckRadius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: dCheckSmallRadius,
                      child: Image.asset(DCheckImages.checklistPremium)),
                  const SizedBox(height: dCheckPadding),
                  AutoSizeText(
                    'You can have an access to an additional emergency checklist and other features',
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 24,
                        height: 1.2,
                        color: dCheckAccentColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: dCheckPadding / 2),
                  Text(
                    'With premium subscription for $safeThroughSubPrice',
                    style: TextStyle(color: dCheckGrey, fontSize: 16),
                  ),
                  const SizedBox(height: dCheckPadding),
                  DContinueButton(
                      onTap: () {
                        // premiumController.sink
                        //     .add(appController.copyWith(isPremium: true));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => PremiumScreen()));
                      },
                      name: 'Get Access'),
                  const SizedBox(height: dCheckPadding / 2),
                  DContinueButton(
                    onTap: () async {
                      final safeThroughSubRestore =
                          await Apphud.restorePurchases();
                      if (kDebugMode ||
                          (safeThroughSubRestore.purchases
                              .map((e) => e.isActive)
                              .contains(true))) {
                        safeThroughSubActive.value = true;
                      }
                    },
                    name: 'Restore',
                    type: DContinueButtonColorType.white,
                  ),
                ],
              ),
            );
          } else {
            return Wrap(
              runSpacing: dCheckPadding / 2,
              children:
                  kitAdditionalCheckList.map((e) => _Item(model: e)).toList(),
            );
          }
        });
    // }
  }
}

class _Item extends StatelessWidget {
  final ChecklistModel model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<bool>(
        preference: preferences.getBool(model.keyValue, defaultValue: false),
        builder: (context, value) {
          return ClickArea(
            onTap: () {
              preferences.setBool(model.keyValue, !value);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: dCheckSmallRadius),
              padding: EdgeInsets.all(dCheckPadding * 0.75),
              child: Row(
                children: [
                  SvgPicture.asset(value
                      ? DCheckIcons.checkFilled
                      : DCheckIcons.checkUnfilled),
                  const SizedBox(width: dCheckPadding * 0.75),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: TextStyle(
                            letterSpacing: -0.15,
                            fontSize: 14,
                          ),
                        ),
                        if (model.desc != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              model.desc!,
                              style: TextStyle(fontSize: 12, color: dCheckGrey),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
