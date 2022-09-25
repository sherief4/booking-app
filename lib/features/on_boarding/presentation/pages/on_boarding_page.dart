import 'package:booking_app/features/on_boarding/presentation/widgets/boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: BoardingBody(),
    );
  }
}
