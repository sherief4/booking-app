part of 'hotels_bloc.dart';

abstract class HotelsEvent extends Equatable {
  const HotelsEvent();

  @override
  List<Object> get props => [];
}

class GetHotelsEvent extends HotelsEvent{
  const GetHotelsEvent();
}