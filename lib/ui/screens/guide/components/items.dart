import 'package:safe_through/data/assets.dart';
import 'package:safe_through/data/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GSKeyPoints extends StatelessWidget {
  final List<String> models;

  const GSKeyPoints({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key points',
          style: TextStyle(
              fontSize: 16,
              color: dCheckAccentColor,
              height: 1.5,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: dCheckPadding / 2),
        Wrap(
          runSpacing: dCheckPadding / 2,
          children: models.map(
            (e) {
              return Container(
                padding: EdgeInsets.symmetric(
                        vertical: dCheckPadding / 2,
                        horizontal: dCheckPadding * 0.75)
                    .copyWith(right: 0),
                decoration:
                    BoxDecoration(color: Color.fromRGBO(230, 240, 255, 1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(DCheckIcons.tableChevronRight),
                    Expanded(child: Text(e))
                  ],
                ),
              );
            },
          ).toList(),
        )
      ],
    );
  }
}

class GSTitle extends StatelessWidget {
  final String text;

  const GSTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(letterSpacing: -0.15, height: 1, fontSize: 24));
  }
}

class GSImage extends StatelessWidget {
  final String image;

  const GSImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: dCheckRadius,
      child: Image.asset(image),
    );
  }
}

class GSListText extends StatelessWidget {
  final String title;
  final String? desc;
  final List<String> text;

  const GSListText(
      {super.key, required this.title, required this.text, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: dCheckSmallRadius),
      padding: EdgeInsets.all(dCheckPadding * 0.75).copyWith(left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: dCheckPadding * 0.75,
              bottom: dCheckPadding * 0.75,
            ),
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(height: 1)),
          ),
          if (desc != null)
            Padding(
              padding: const EdgeInsets.only(
                left: dCheckPadding * 0.75,
                bottom: dCheckPadding * 0.75,
              ),
              child: Text(
                desc!,
                style: TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.15),
              ),
            ),
          Wrap(
            runSpacing: dCheckPadding / 4,
            children: text.map(
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
          )
        ],
      ),
    );
  }
}

class GSText extends StatelessWidget {
  final String text;

  const GSText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(height: 1.2));
  }
}
