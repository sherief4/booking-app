import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          width: double.infinity,
          height: 380.0,
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 100.0,
          left: 16.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Find best deals',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.0,
                ),
              ),
              VerticalSpace(
                1.5,
              ),
              Text(
                'Extraordinary five-star \noutdoor activities',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
