import 'package:booking_app/features/hotels/data/models/hotel_model.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/presentation/pages/hotel/widgets/hotel_body.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({Key? key, required this.hotel,}) : super(key: key);
final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HotelBody(hotel: hotel,),
    );
  }
}
