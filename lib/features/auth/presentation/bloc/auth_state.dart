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
  List<Object> get props => [data];
}

class AuthErrorState extends AuthState {
  const AuthErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}

class GetProfileSuccessState extends AuthState {
  const GetProfileSuccessState({required this.data});

  final Data data;

  @override
  List<Object> get props => [data];
}

class GetProfileErrorState extends AuthState {
  const GetProfileErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}

class ChooseImageSuccessState extends AuthState {
  const ChooseImageSuccessState({required this.image});

  final File image;

  @override
  List<Object> get props => [image];
}

class UpdateProfileSuccessState extends AuthState {
  const UpdateProfileSuccessState({required this.data});

  final Data data;

  @override
  List<Object> get props => [data];
}

class UpdateProfileErrorState extends AuthState {
  const UpdateProfileErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}

class ChangePasswordSuccessState extends AuthState {}

class ChangePasswordLoadingState extends AuthState {}

class ChangePasswordErrorState extends AuthState {
  const ChangePasswordErrorState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
