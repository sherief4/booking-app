import 'package:booking_app/core/widgets/horizontal_space.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/app_bar_background.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/popular_destinations_widget.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            background: AppBarBackground(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const PopularDestinationsWidget(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hotels',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const VerticalSpace(
                      2.0,
                    ),
                    Material(
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
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/places/cairo.jpg',
                                  ),
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    15.0,
                                  ),
                                  bottomLeft: Radius.circular(
                                    15.0,
                                  ),
                                ),
                              ),
                            ),
                            const HorizontalSpace(
                              1.0,
                            ),
                            Column(
                              children: [
                                Text('Grand Royal Hotel' ,style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
