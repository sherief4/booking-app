import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widgets/horizontal_space.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/presentation/pages/hotel/hotel_page.dart';
import 'package:flutter/material.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({
    Key? key,
    required this.hotel,
  }) : super(key: key);
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context: context, route:  HotelPage(hotel: hotel,),);
      },
      child: Material(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        elevation: 4.0,
        child: Container(
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
                      '$BASE_URL$IMAGES${hotel.hotelImages![0].image}',
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      const VerticalSpace(
                        0.5,
                      ),
                      Text(
                        hotel.address!,
                        overflow: TextOverflow.ellipsis,
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
                                  '\$ ${hotel.price}',
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
                                  '${hotel.rate}',
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
