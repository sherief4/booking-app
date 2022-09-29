import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/widgets/horizontal_space.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({
    Key? key,
    required this.hotelName,
    required this.location,
    required this.price,
    required this.rate,
    required this.image,
  }) : super(key: key);
  final String hotelName;
  final String location;
  final int price;
  final String image;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        15.0,
      ),
      elevation: 4.0,
      child: Container(
        width: double.infinity,
        height: 125.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    15.0,
                  ),
                  bottomLeft: Radius.circular(
                    15.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotelName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  const VerticalSpace(
                    0.5,
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 224.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: mainColor,
                              size: 20.0,
                            ),
                            const HorizontalSpace(
                              0.5,
                            ),
                            const Text(
                              '2.0 km to city',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$ $price',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star,
                              color: mainColor,
                              size: 20.0,
                            ),
                            const HorizontalSpace(
                              0.5,
                            ),
                            Text(
                              '$rate',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              '/per night',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
