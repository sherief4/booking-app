import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          width: double.infinity,
          color: mainColor,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How can we help',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const VerticalSpace(
                  1.0,
                ),
                SizedBox(
                  height: 55.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search help articles',
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
              ],
            ),
          ),
        ),

      ],
    );
  }
}
