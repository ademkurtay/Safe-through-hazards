import 'package:safe_through/data/assets.dart';
import 'package:safe_through/data/styles.dart';
import 'package:safe_through/models/hazard.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:safe_through/ui/widgets/show_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HazardScreen extends StatefulWidget {
  const HazardScreen({super.key});

  @override
  State<HazardScreen> createState() => _HazardScreenState();
}

class _HazardScreenState extends State<HazardScreen> {
  PageController _hazardController = PageController(viewportFraction: 0.93);
  PageController _impactController = PageController(viewportFraction: 0.93);

  // PageController _hazardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Volcanic Hazard')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(dCheckPadding)
                  .copyWith(bottom: dCheckPadding / 2),
              child: Text(
                'The Hazard',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 192,
              child: PageView.builder(
                controller: _hazardController,
                itemCount: hsHazardModels.length,
                itemBuilder: (context, index) {
                  return _Item(model: hsHazardModels[index]);
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.all(dCheckPadding).copyWith(
                    bottom: dCheckPadding / 2, top: dCheckPadding * 1.5),
                child: Text('The Impact',
                    style: Theme.of(context).textTheme.bodyLarge)),
            SizedBox(
              height: 192,
              child: PageView.builder(
                controller: _impactController,
                itemCount: hsImpactModels.length,
                itemBuilder: (context, index) {
                  return _Item(model: hsImpactModels[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final HazardModel model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ShowVideoScreen(
              video: model.video,
            ),
            fullscreenDialog: true,
          )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: dCheckPadding / 4),
        // margin: EdgeInsets.only(right: dCheckPadding),
        padding: EdgeInsets.all(dCheckPadding / 2),
        decoration: BoxDecoration(
          borderRadius: dCheckSmallRadius,
          image: DecorationImage(
            image: Image.asset(model.imageSrc).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: dCheckPadding * 0.75, vertical: dCheckPadding / 2),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: dCheckSmallRadius),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.name,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(width: dCheckPadding / 2),
                SvgPicture.asset(DCheckIcons.play)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
