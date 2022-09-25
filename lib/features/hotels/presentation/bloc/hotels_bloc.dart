import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'hotels_event.dart';
part 'hotels_state.dart';


class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {

  static HotelsBloc get(context) => BlocProvider.of<HotelsBloc>(context);
  int curIndex = 0 ;

  HotelsBloc() : super(HotelsInitial()) {
    on<HotelsEvent>((event, emit) {
    if(event is BottomNavChangeEvent){
      emit(HotelsChangeBottomNavState(index: event.index));
    }
    });
  }

}
