import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/app_bar_background.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/hotels_list_widget.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/popular_destinations_widget.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
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
                    const HotelsListWidget(),
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
