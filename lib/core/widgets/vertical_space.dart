import 'package:booking_app/core/utils/constants/size_config.dart';
import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.ratio, {super.key});
  final double? ratio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * ratio!,
    );
  }
}