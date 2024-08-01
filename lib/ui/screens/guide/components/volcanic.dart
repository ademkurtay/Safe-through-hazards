import 'package:safe_through/ui/screens/guide/components/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/assets.dart';
import '../../../../data/styles.dart';
import '../../../widgets/buttons/click_area.dart';

class GSVolcanicView extends StatelessWidget {
  const GSVolcanicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: ClickArea(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(DCheckIcons.back)),
        ),
        centerTitle: true,
        titleSpacing: 0,
        title: Text('Volcanic Exposure',
            style: TextStyle(fontSize: 17, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(dCheckPadding),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GSText(
                  text:
                      'Health Effects of Short-term Volcanic SO2 Exposure and Recommended Actions. The colors in the table indicate the average concentration of SO2 for 10-15 minutes. The health effects depend both on the time of SO2 exposure and SO2 concentration. Health effect limits are defined as the average concentration of SO2 of 350 µg/m3 for one hour or 125 µg/m3 for 24 hours.'),
              const SizedBox(height: dCheckPadding),
              GSImage(image: DCheckImages.guide(6))
            ],
          ),
        ),
      ),
    );
  }
}
