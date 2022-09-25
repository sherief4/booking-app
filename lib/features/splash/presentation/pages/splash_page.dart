import 'package:booking_app/core/utils/constants/size_config.dart';
import 'package:booking_app/features/splash/presentation/pages/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
