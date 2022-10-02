import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/constants/size_config.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/custom_carousel_slider.dart';
import 'package:booking_app/features/hotels/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';

class AppBarBackground extends StatelessWidget {
  const AppBarBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomCarouselSlider(),
        Positioned(
          top: SizeConfig.defaultSize! * 4,
          left: SizeConfig.defaultSize! * 2,
          right: SizeConfig.defaultSize! * 2,
          child: SizedBox(
            height: 50.0,
            child: TextFormField(
              onTap: () {
                navigateTo(context: context, route: const SearchPage());
              },
              autofocus: false,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                fillColor: Colors.white,
                filled: true,
                hintStyle: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Where are you going?',
                prefixIcon: const Icon(
                  Icons.search,
                  color: mainColor,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: SizedBox(
            height: 40.0,
            width: 120.0,
            child: DefaultButton(
              onPressed: () {},
              color: mainColor,
              textColor: Colors.white,
              text: 'View Hotels',
            ),
          ),
        ),
      ],
    );
  }
}
