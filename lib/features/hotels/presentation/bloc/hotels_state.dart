part of 'hotels_bloc.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

class HotelsInitial extends HotelsState {}

class GetHotelsLoadingState extends HotelsState {}

class GetHotelsSuccessState extends HotelsState {
  const GetHotelsSuccessState({
    required this.hotels,
  });

  final List<Hotel> hotels;
  @override
  List<Object> get props => [hotels];
}

class GetHotelsErrorState extends HotelsState{
  const GetHotelsErrorState({required this.error});
final String error;
  @override
  List<Object> get props => [error];
}
