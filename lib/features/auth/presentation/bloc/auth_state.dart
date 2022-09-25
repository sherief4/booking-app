part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  const AuthSuccessState({required this.data});
  final Data data;
  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
 const AuthErrorState({required this.error});
  final String error;
 @override
 List<Object> get props => [];
}

class GetProfileSuccessState extends AuthState{
  const GetProfileSuccessState({required this.data});
  final Data data;
  @override
  List<Object> get props => [];
}
class GetProfileErrorState extends AuthState{
  const GetProfileErrorState({required this.error});
final String error;
  @override
  List<Object> get props => [];
}
