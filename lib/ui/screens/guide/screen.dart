import 'package:apphud/apphud.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:safe_through/data/assets.dart';
import 'package:safe_through/data/styles.dart';
import 'package:safe_through/main.dart';
import 'package:safe_through/ui/screens/premium/screen.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:safe_through/ui/widgets/buttons/continue.dart';
import 'package:safe_through/ui/widgets/show_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'components/after.dart';
import 'components/preparing.dart';
import 'components/volcanic.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  AutoSizeGroup topElementGroup = AutoSizeGroup();

  late ValueNotifier<bool> showPremium;

  @override
  void initState() {
    showPremium = ValueNotifier(true);
    super.initState();
  }

  @override
  void dispose() {
    showPremium.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Safety Guide')),
      body: ValueListenableBuilder(
          valueListenable: safeThroughSubActive,
          builder: (context, isSubActive, subWidget) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(dCheckPadding),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ClickArea(
                                onTap: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            GSPreparingView())),
                                child: Container(
                                  padding: EdgeInsets.all(dCheckPadding * 0.75),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      borderRadius: dCheckSmallRadius),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                            borderRadius: dCheckSmallRadius,
                                            child: Image.asset(
                                              DCheckImages.guide(1),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      const SizedBox(
                                          height: dCheckPadding * 0.75),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: AutoSizeText(
                                                  'Preparing for a Volcanic Eruption',
                                                  maxLines: 2,
                                                  group: topElementGroup,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      height: 1.2,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                          const SizedBox(
                                              width: dCheckPadding / 4),
                                          SvgPicture.asset(
                                              DCheckIcons.chevronRight)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: dCheckPadding / 2),
                            Expanded(
                              child: ClickArea(
                                onTap: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => GSAfterView())),
                                child: Container(
                                  padding: EdgeInsets.all(dCheckPadding * 0.75),
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      borderRadius: dCheckSmallRadius),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                            borderRadius: dCheckSmallRadius,
                                            child: Image.asset(
                                              DCheckImages.guide(2),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      const SizedBox(
                                          height: dCheckPadding * 0.75),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: AutoSizeText(
                                                  'After a Volcanic\n'
                                                  'Eruption',
                                                  maxLines: 2,
                                                  group: topElementGroup,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      height: 1.2,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                          const SizedBox(
                                              width: dCheckPadding / 4),
                                          SvgPicture.asset(
                                              DCheckIcons.chevronRight)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: dCheckPadding / 2),
                      Expanded(
                        child: ClickArea(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => GSVolcanicView())),
                          child: Container(
                            padding: EdgeInsets.all(dCheckPadding * 0.75),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: dCheckSmallRadius),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ClipRRect(
                                        borderRadius: dCheckSmallRadius,
                                        child: Image.asset(
                                          DCheckImages.guide(3),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                const SizedBox(height: dCheckPadding * 0.75),
                                Row(
                                  children: [
                                    Expanded(
                                        child: AutoSizeText(
                                            'Health Effects of Short-term Volcanic SO2 Exposure and Recommended Actions',
                                            maxLines: 2,
                                            group: topElementGroup,
                                            style: TextStyle(
                                                fontSize: 14,
                                                height: 1.2,
                                                fontWeight: FontWeight.w700))),
                                    const SizedBox(width: dCheckPadding / 4),
                                    SvgPicture.asset(DCheckIcons.chevronRight)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: dCheckPadding / 2),
                      Expanded(
                          child: ClickArea(
                        onTap: () {
                          // if (appController.isPremium) {
                          if (safeThroughSubActive.value) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ShowVideoScreen(
                                          video:
                                              'How to protect yourself from breathing volcanic ash',
                                        ),
                                    fullscreenDialog: true));
                          } else {
                            showPremium.value = true;
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(dCheckPadding / 2),
                          decoration: BoxDecoration(
                              borderRadius: dCheckSmallRadius,
                              image: DecorationImage(
                                  image:
                                      Image.asset(DCheckImages.guideVideoImage)
                                          .image,
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: dCheckPadding / 2,
                                  horizontal: dCheckPadding * 0.75),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: dCheckSmallRadius),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      'How to protect yourself from\n'
                                      'breathing volcanic ashes',
                                      group: topElementGroup,
                                      style: TextStyle(
                                          fontSize: 14,
                                          height: 1.2,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SvgPicture.asset(isSubActive
                                      ? DCheckIcons.chevronRight
                                      : DCheckIcons.lock)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: showPremium,
                  builder: (context, value, child) {
                    if (!value || isSubActive) {
                      return SizedBox();
                    }
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: dCheckBackColor.withOpacity(0.8),
                      padding: EdgeInsets.all(dCheckPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClickArea(
                              onTap: () => showPremium.value = false,
                              child: SvgPicture.asset(DCheckIcons.close)),
                          const SizedBox(height: dCheckPadding / 2),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.all(dCheckPadding),
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    borderRadius: dCheckRadius),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        height: 192,
                                        padding:
                                            EdgeInsets.all(dCheckPadding / 2),
                                        decoration: BoxDecoration(
                                            borderRadius: dCheckSmallRadius,
                                            image: DecorationImage(
                                                image: Image.asset(DCheckImages
                                                        .guideVideoImage)
                                                    .image,
                                                fit: BoxFit.cover)),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: dCheckPadding / 2,
                                                horizontal:
                                                    dCheckPadding * 0.75),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                borderRadius:
                                                    dCheckSmallRadius),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: AutoSizeText(
                                                    'How to protect yourself from\n'
                                                    'breathing volcanic ashes',
                                                    group: topElementGroup,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        height: 1.2,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                SvgPicture.asset(isSubActive
                                                    ? DCheckIcons.chevronRight
                                                    : DCheckIcons.lock)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: dCheckPadding),
                                    Text(
                                      'How to protect yourself from breathing volcanic ashes video guide',
                                      style: TextStyle(
                                          fontSize: 24,
                                          height: 1.2,
                                          color: dCheckAccentColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: dCheckPadding / 2),
                                    Text(
                                      'Will be available with premium\n'
                                      'subscription for $safeThroughSubPrice',
                                      style: TextStyle(
                                          color: dCheckGrey, fontSize: 16),
                                    ),
                                    const SizedBox(height: dCheckPadding),
                                    DContinueButton(
                                        onTap: () {
                                          // showPremium.value = false;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  fullscreenDialog: true,
                                                  builder: (context) =>
                                                      PremiumScreen()));
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
                                          showPremium.value = false;
                                        }
                                      },
                                      name: 'Restore',
                                      type: DContinueButtonColorType.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            );
          }),
    );
  }
}
