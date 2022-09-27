import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/features/auth/presentation/pages/profile/pages/help/widgets/help_body.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        backgroundColor: mainColor,
      ) ,
      body:const SafeArea(child: HelpBody()),
    );
  }
}
