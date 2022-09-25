import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(
          8.0,
        ),
        SizedBox(
          height: 200.0,
          child: Image.asset(image),
        ),
        const VerticalSpace(
         14.0,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const VerticalSpace(
          2.0,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
