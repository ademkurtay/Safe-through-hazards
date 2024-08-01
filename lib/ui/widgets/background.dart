import 'package:flutter/material.dart';

class DBackground extends StatelessWidget {
  final String image;

  const DBackground({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
