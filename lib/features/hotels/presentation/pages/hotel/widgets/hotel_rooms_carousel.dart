import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/hotels/data/models/hotel_image_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HotelRoomsCarousel extends StatelessWidget {
  const HotelRoomsCarousel({Key? key, required this.images}) : super(key: key);
  final List<HotelImageModel> images;

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
      items: images
          .map((image) => Image(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 380.0,
                image: NetworkImage('$BASE_URL$IMAGES${image.image}'),
              ))
          .toList(),
    );
  }
}
