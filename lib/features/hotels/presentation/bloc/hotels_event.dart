part of 'hotels_bloc.dart';

abstract class HotelsEvent extends Equatable {
  const HotelsEvent();

  @override
  List<Object> get props => [];
}

class BottomNavChangeEvent extends HotelsEvent{
const BottomNavChangeEvent({required this.index});
  final int index;

@override
List<Object> get props => [index];
}
