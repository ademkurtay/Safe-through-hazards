import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/styles.dart';
import 'click_area.dart';

enum DContinueButtonColorType { accent, white }

class DContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? colorText;
  final String name;
  final DContinueButtonColorType type;
  final double? padding;
  final double? horizontalPadding;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;

  const DContinueButton(
      {Key? key,
      required this.onTap,
      required this.name,
      this.padding,
      this.colorText,
      this.horizontalPadding,
      this.type = DContinueButtonColorType.accent,
      this.radius,
      this.fontSize,
      this.fontWeight,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClickArea(
        onTap: onTap,
        child: Container(
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
              color: type == DContinueButtonColorType.accent
                  ? dCheckAccentColor
                  : Colors.transparent),
          padding: EdgeInsets.symmetric(
              vertical: padding ?? 14,
              horizontal: horizontalPadding ?? padding ?? 10),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: fontSize ?? 16,
                  height: 1.25,
                  letterSpacing: 0,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  color: colorText ??
                      (type == DContinueButtonColorType.white
                          ? dCheckAccentColor
                          : dCheckWhite)),
            ),
          ),
        ),
      ),
    );
  }
}
