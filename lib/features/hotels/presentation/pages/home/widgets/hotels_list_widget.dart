import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/widgets/hotel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsListWidget extends StatelessWidget {
  const HotelsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsBloc, HotelsState>(
      builder: (context, state) {
        if (state is GetHotelsSuccessState) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return HotelWidget(
                hotel: state.data.hotels![index],
              );
            },
            separatorBuilder: (context, index) {
              return const VerticalSpace(2.0,);
            },
            itemCount: state.data.hotels!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
