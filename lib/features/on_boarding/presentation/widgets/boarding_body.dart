import 'dart:async';

import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/constants/size_config.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/features/auth/presentation/pages/login/login_page.dart';
import 'package:booking_app/features/auth/presentation/pages/register/register_page.dart';
import 'package:booking_app/features/on_boarding/presentation/widgets/custom_indicator.dart';
import 'package:booking_app/features/on_boarding/presentation/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class BoardingBody extends StatefulWidget {
  const BoardingBody({Key? key}) : super(key: key);

  @override
  State<BoardingBody> createState() => _BoardingBodyState();
}

class _BoardingBodyState extends State<BoardingBody> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(
          seconds: 4,
        ), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Stack(
        children: [
          CustomPageView(
            pageController: pageController,
          ),
          Positioned(
            bottom: SizeConfig.defaultSize! * 24.0,
            left: SizeConfig.defaultSize! * 18.0,
            child: CustomIndicator(
              controller: pageController,
            ),
          ),
          Positioned(
            bottom: SizeConfig.defaultSize! * 12,
            left: SizeConfig.defaultSize! * 4,
            right: SizeConfig.defaultSize! * 4,
            child: DefaultButton(
              onPressed: () {
                navigateTo(
                  context: context,
                  route: const LoginPage(),
                );
              },
              color: mainColor,
              textColor: Colors.white,
              text: 'Login',
            ),
          ),
          Positioned(
            bottom: SizeConfig.defaultSize! * 5,
            left: SizeConfig.defaultSize! * 4,
            right: SizeConfig.defaultSize! * 4,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25.0,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              child: DefaultButton(
                onPressed: () {
                  navigateTo(
                    context: context,
                    route: const RegisterPage(),
                  );
                },
                color: Colors.white.withOpacity(
                  0.8,
                ),
                textColor: Colors.black,
                text: 'Create an account',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
