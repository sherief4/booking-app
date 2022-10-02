import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/presentation/pages/hotel/widgets/hotel_rooms_carousel.dart';
import 'package:flutter/material.dart';

class HotelBody extends StatelessWidget {
  const HotelBody({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            background: HotelRoomsCarousel(
              images: hotel.hotelImages!,
            ),
          ),
        ),
      ],
    );
  }
}
