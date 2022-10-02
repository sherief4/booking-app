import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/hotels/data/models/hotel_data_model.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel_data.dart';
import 'package:booking_app/features/hotels/domain/usecases/get_hotels.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hotels_event.dart';

part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final GetHotelsUseCase getHotelsUseCase;

  static HotelsBloc get(context) => BlocProvider.of<HotelsBloc>(context);

  HotelsBloc({required this.getHotelsUseCase}) : super(HotelsInitial()) {
    on<HotelsEvent>((event, emit) async {
      if (event is GetHotelsEvent) {
        final failureOrData = await getHotelsUseCase(
          count: 7,
          page: 1,
        );
        failureOrData.fold((l){
          emit(GetHotelsErrorState(error: mapFailureToString(l)));
        }, (r){

          emit(GetHotelsSuccessState(data: r));
        });
      }
    });
  }
}
