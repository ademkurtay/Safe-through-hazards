import 'package:safe_through/data/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/assets.dart';

class KSIntroductionView extends StatelessWidget {
  const KSIntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: dCheckSmallRadius,
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: EdgeInsets.all(dCheckPadding * 0.75).copyWith(left: 0),
      child: Column(
        children: [
          Wrap(
            runSpacing: dCheckPadding / 4,
            children: [
              'Develop an evacuation plan and a sheltering plan for yourself, your family, and others in your household',
              'Review the plans and ensure everyone understands them',
              'Put together an emergency supply kit'
            ].map(
              (e) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(DCheckIcons.tableChevronRight),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: dCheckPadding / 4),
                      child: Text(
                        e,
                        style: TextStyle(height: 1.2),
                      ),
                    ))
                  ],
                );
              },
            ).toList(),
          ),
          const SizedBox(height: dCheckPadding * 0.75),
          Padding(
            padding: const EdgeInsets.only(left: dCheckPadding * 0.75),
            child: Text(
                'To assemble your kit store items in airtight plastic bags and put your entire disaster supplies kit in one or two easy-to-carry containers such as plastic bins or a duffel bag'),
          ),
        ],
      ),
    );
  }
}
