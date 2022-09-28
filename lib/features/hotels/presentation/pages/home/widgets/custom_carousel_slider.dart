import 'package:booking_app/features/hotels/presentation/pages/home/widgets/carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        pauseAutoPlayOnTouch: false,
        pageSnapping: false,
        pauseAutoPlayOnManualNavigate: false,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
        autoPlayAnimationDuration: const Duration(
          seconds: 1,
        ),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1.0,
      ),
      items: const [
        CarouselItem(
          image: 'assets/images/carousel/carousel_1.jpg',
        ),
        CarouselItem(
          image: 'assets/images/carousel/carousel_2.jpg',
        ),
        CarouselItem(
          image: 'assets/images/carousel/carousel_3.jpg',
        ),
      ],
    );
  }
}
