import 'package:booking_app/core/utils/constants/size_config.dart';
import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.ratio, {super.key});
  final double? ratio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * ratio!,
    );
  }
}