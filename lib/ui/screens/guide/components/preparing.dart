import 'package:safe_through/data/assets.dart';
import 'package:safe_through/data/styles.dart';
import 'package:safe_through/ui/screens/guide/components/items.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GSPreparingView extends StatelessWidget {
  const GSPreparingView({super.key});

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
        title: Text('Preparing for an Volcanic Eruption',
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
                    'and your family after a volcanic eruption',
                'Follow the advice of local officials for information on preparing for a volcanic eruption, and if necessary, on how to evacuate (leave the area) or take shelter where you are'
              ]),
              const SizedBox(height: dCheckPadding * 1.5),
              GSTitle(text: 'Make a Plan and Get Supplies'),
              const SizedBox(height: dCheckPadding),
              GSImage(image: DCheckImages.guide(1)),
              const SizedBox(height: dCheckPadding),
              GSListText(
                title: 'Make a Plan',
                desc: 'Be prepared either to shelter or to evacuate',
                text: [
                  'Develop an evacuation plan and a sheltering plan for yourself, your family, and others in your household',
                  'Review the plans and make sure that everyone understands them'
                ],
              ),
              const SizedBox(height: dCheckPadding),
              GSListText(
                  title: 'Get Supplies',
                  desc:
                      "If you haven't already done so, put together an emergency supply kit.\n"
                      "Supplies should include the following:",
                  text: [
                    'Flashlight and extra batteries',
                    'First aid kit and manual',
                    'Emergency food and water',
                    'Manual(nonelectric) can opener',
                    'Essential medicines',
                    'Sturdy shoes',
                    'Respiratory(breathing) protection',
                    'Eye protection(goggles)',
                    'Battery - powered radio'
                  ]),
              const SizedBox(height: dCheckPadding),
              GSListText(
                title: 'Know How to Protect\n'
                    'Yourself From Ash',
                desc: 'Exposure to ash can harm your health,\n'
                    'particularly the respiratory (breathing) tract',
                text: [
                  'To protect yourself while you are outdoors or while you are cleaning up ash that has gotten indoors, use a NIOSH Approved N95 respirator (also known as an "air purifying respirator")',
                  "N95 respirators can be purchased at businesses such as hardware stores. It is important to follow directions for proper use of this respirator. For more information, see NIOSH-Approved Disposable Particulate Respirators (Filtering Facepieces)",
                  "If you don't have a NIOSH Approved N95 respirator, you can protect yourself by using\n"
                      "a nuisance dust mask as a last resort, but you should stay outdoors for only short periods while dust is falling. Nuisance dust masks can provide comfort and relief from exposure to relatively non-hazardous contaminants such as pollen, but they do not offer as much protection as a NIOSH Approved N95 respirator. Cleanup or emergency workers may need a different type of breathing protection"
                ],
              ),
              const SizedBox(height: dCheckPadding * 1.5),
              GSTitle(text: 'Prepare For an Emergency Evacuation'),
              const SizedBox(height: dCheckPadding),
              GSText(
                  text:
                      "Follow authorities' instructions if they tell you to leave the area. Though it may seem safe to stay at home and wait out an eruption, doing so could be very dangerous. Volcanoes spew hot, dangerous gases, ash, lava, and rock that are powerfully destructive"),
              const SizedBox(height: dCheckPadding),
              GSImage(image: DCheckImages.guide(4)),
              const SizedBox(height: dCheckPadding),
              GSListText(
                title: 'Stay Informed',
                text: [
                  'Tune in the radio or television for volcano updates',
                  'Listen for disaster sirens and warning signals',
                  'Review your emergency plan'
                ],
              ),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Gather Supplies', text: [
                'Gather your emergency supplies. Be sure to pack at least a 1-week supply of prescription medications',
                'Prepare an emergency kit for your vehicle with food, flares, booster cables, maps, tools, a first aid kit, a fire extinguisher, sleeping bags, a flashlight, batteries, etc.'
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Prepare Your Car', text: [
                "Fill your vehicle's gas tank",
                "If no vehicle is available, make arrangements with friends or family for transportation, or follow authorities' instructions on where to obtain transportation",
                'Place vehicles under cover, if at all possible'
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Protect Pets and Livestock', text: [
                "Put livestock in an enclosed area",
                "Plan ahead to take pets with you, but be aware that many emergency shelters cannot accept animals. Learn more about evacuating with your pet"
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Prepare Your Home', text: [
                "Fill your clean water containers",
                "Fill sinks and bathtubs with water as an extra supply for washing",
                "Adjust the thermostat on refrigerators and freezers to the coolest possible temperature. If the power goes out, food will stay cooler longer"
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(
                  title: 'Know What Steps to Take\n'
                      'as You Evacuate',
                  text: [
                    "Take only essential items with you, including\n"
                        "at least a 1-week supply of prescription medications",
                    "If you have time, turn off the gas, electricity, and water",
                    "Disconnect appliances to reduce the likelihood of electrical shock when power\n"
                        "is restored",
                    "Make sure your automobile's emergency kit\n"
                        "is ready",
                    "Follow designated evacuation routes—others may be blocked—and expect heavy traffic and delays"
                  ]),
              const SizedBox(height: dCheckPadding * 1.5),
              GSTitle(
                  text: 'Prepare to Shelter\n'
                      'Where You Are'),
              const SizedBox(height: dCheckPadding),
              GSImage(image: DCheckImages.guide(5)),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Get Your Home Ready', text: [
                "Close and lock all windows and outside doors",
                'Turn off all heating and air conditioning systems and fans',
                'Close the fireplace damper',
                'Organize your emergency supplies and make sure household members know where the supplies ar',
                'Make sure the radio is working'
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Find a Safe Place to Shelter', text: [
                "Go to an interior room without windows that\n"
                    'is above ground level',
                'Bring your pets with you, and be sure to bring additional food and water supplies for them'
              ]),
              const SizedBox(height: dCheckPadding),
              GSListText(title: 'Stay Connected and Informed', text: [
                "Keep listening to your radio or television until you are told all is safe or you are told to evacuate. Local authorities may evacuate specific areas at greatest risk in your community",
                'Have a hard-wired (non-portable) telephone in the room you select',
                "Call your emergency contact—a friend or family member who does not live near the volcano—and have the phone available if you need to report a life-threatening condition. Remember that telephone equipment may\n"
                    'be overwhelmed or damaged during an emergency'
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
