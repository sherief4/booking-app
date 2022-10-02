import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/destination_widget.dart';
import 'package:flutter/material.dart';

class PopularDestinationsWidget extends StatelessWidget {
  const PopularDestinationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> places = [
      'Cairo',
      'London',
      'Madrid',
      'Paris',
      'Venice',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 16.0,
          ),
          child: Text(
            'Popular Destinations',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const VerticalSpace(
          2.0,
        ),
        SizedBox(
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return DestinationWidget(
                name: places[index],
                image: places[index],
              );
            },
            itemCount: 5,
          ),
        ),
        const VerticalSpace(
          2.0,
        ),
      ],
    );
  }
}
