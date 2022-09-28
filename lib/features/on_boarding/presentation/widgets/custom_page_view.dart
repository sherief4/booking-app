import 'package:booking_app/features/on_boarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          image: 'assets/images/boarding/boarding_1.png',
          title: 'Plan your trips',
          subtitle: 'Book one of our unique hotels to \nescape the ordinary ones',
        ),
        PageViewItem(
          image: 'assets/images/boarding/boarding_2.png',
          title: 'Find the best deals',
          subtitle:
              'Find deals from any season from cosy \ncountry hotels to city flats',
        ),
        PageViewItem(
          image: 'assets/images/boarding/boarding_3.png',
          title: 'Best travelling all time',
          subtitle:
              'Find deals from any season from cosy \ncountry hotels to city flats',
        ),
      ],
    );
  }
}
