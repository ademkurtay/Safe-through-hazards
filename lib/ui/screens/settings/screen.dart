import 'package:safe_through/data/assets.dart';
import 'package:safe_through/data/styles.dart';
import 'package:safe_through/main.dart';
import 'package:safe_through/ui/widgets/buttons/click_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: dCheckPadding),
        child: Column(
          children: [
            _Item(
                name: 'Terms of Use',
                onTap: () {
                  safeThroughTOU();
                }),
            _Item(
                name: 'Privacy Policy',
                onTap: () {
                  safeThroughPP();
                }),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const _Item({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: dCheckPadding / 2),
      child: ClickArea(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: dCheckPadding, vertical: dCheckPadding * 0.75),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              SvgPicture.asset(DCheckIcons.chevronRight)
            ],
          ),
        ),
      ),
    );
  }
}
