import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/hotels/presentation/layout/hotels_layout.dart';
import 'package:booking_app/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? fadingAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );
    fadingAnimation = Tween<double>(begin: 0.2, end: 1).animate(controller!);
    controller?.repeat(
      reverse: true,
    );
    goToNextPage();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void goToNextPage() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        final bool check = sharedPreferences.containsKey(CACHED_USER);

        if(check){
          navigateAndFinish(context: context, route: const HotelsLayout());
        }else{
          navigateAndFinish(context: context, route: const OnBoardingPage());
        }
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: AnimatedBuilder(
            animation: fadingAnimation!,
            builder: (context, _) => Opacity(
              opacity: fadingAnimation?.value,
              child: const Text(
                'Booking App',
                style: TextStyle(
                  fontFamily: 'Josefin',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 48.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
