import 'package:safe_through/ui/screens/guide/components/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/assets.dart';
import '../../../../data/styles.dart';
import '../../../widgets/buttons/click_area.dart';

class GSAfterView extends StatelessWidget {
  const GSAfterView({super.key});

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
        title: Text('After a Volcanic Eruption',
            style: TextStyle(fontSize: 17, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(dCheckPadding),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GSKeyPoints(models: [
                'You can do many things to protect yourself\n'
                    'and your family after a volcanic eruption.',
                "Pay attention to warnings and obey instructions from local authorities",
                'Protect yourself and others from ash'
              ]),
              const SizedBox(height: dCheckPadding * 1.5),
              GSTitle(text: 'Stay Safe After a Volcanic Eruption'),
              const SizedBox(height: dCheckPadding),
              GSImage(image: DCheckImages.guide(2)),
              const SizedBox(height: dCheckPadding),
              GSListText(
                  title: 'Listen to authorities and stay informed',
                  text: [
                    'Pay attention to warnings, and obey instructions from local authorities. For example, stay indoors until local health officials tell you it is safe to go outside',
                    'Listen to local news updates for information about air quality, drinking water, and roads'
                  ]),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Keep Ash Out of Your Home', text: [
                'Turn off all heating and air conditioning units and fans, and close windows, doors, and fireplace and woodstove dampers to help keep ash and gases from getting into your house',
                'Replace disposable furnace filters or clean permanent furnace filters frequently',
                'If your drinking water has ash in it, use another source of drinking water, such as purchased bottled water, until your water can be tested'
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Protect Your Health', text: [
                'Stay away from ashfall areas, if possible. Avoid contact with ash as much as you can',
                'Keep your skin covered to avoid irritation from contact with ash',
                'Wear goggles to protect your eyes from ash',
                'Do not travel unless you have to. Driving in ash is hazardous to your health and your car. Driving will stir up more ash that can clog engines and stall vehicles',
                'Clear roofs of ash. Ash is very heavy and can cause buildings to collapse. Be very cautious when working on a roof. Ash can be slippery and make it easy to fall'
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(
                  title: 'Wear a Respirator to Protect Your Lungs From Ash',
                  desc:
                      'Exposure to ash can harm your health, particularly your ability to breathe well',
                  text: [
                    'Wear a NIOSH Approved N95 respirator (also known as an "air purifying respirator") to protect yourself while you are outdoors or while you are cleaning up ash that has gotten indoors',
                    "If you don't have a NIOSH Approved N95 respirator, you can protect yourself by using a nuisance dust mask as a last resort, but you should stay outdoors for only short periods while dust is falling. Nuisance dust masks can provide comfort and relief from exposure to relatively non-hazardous contaminants such as pollen, but they do not offer as much protection as a particulate respirator. Note that disposable particulate respirators do not filter toxic gases and vapors"
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
