part of 'hotels_bloc.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

class HotelsInitial extends HotelsState {}

class HotelsChangeBottomNavState extends HotelsState {
  const HotelsChangeBottomNavState({
    required this.index,
  });

  final int index;

  @override
  List<Object> get props => [];
}