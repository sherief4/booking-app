import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({Key? key, required this.name, required this.image})
      : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left:16.0,right: 8.0,),
      child: Container(
        height: 150.0,
        width: 250.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/places/${image.toLowerCase()}.jpg',
            ),
          ),

          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 16.0,
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
