import 'package:booking_app/core/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(
        activeDotColor: mainColor,
        dotColor: Colors.grey.withOpacity(
          0.4,
        ),
        dotHeight: 10.0,
        dotWidth: 10.0,
      ),
    );
  }
}
