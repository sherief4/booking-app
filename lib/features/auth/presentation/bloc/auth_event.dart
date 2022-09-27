part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});

  final String email;

  final String password;

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  final String email;
  final String name;
  final String password;
  final String passwordConfirmation;

  @override
  List<Object> get props => [
        name,
        email,
        password,
        passwordConfirmation,
      ];
}

class GetProfileEvent extends AuthEvent {
  const GetProfileEvent();

  @override
  List<Object> get props => [];
}

class ChooseProfileImageEvent extends AuthEvent {
  const ChooseProfileImageEvent({required this.image});

  final File image;

  @override
  List<Object> get props => [image];
}

class UpdateProfileEvent extends AuthEvent {
  const UpdateProfileEvent({
    required this.token,
    required this.email,
    required this.name,
    required this.image,
  });

  final String token;

  final String email;

  final String name;
  final File image;

  @override
  List<Object> get props => [token, name, email, image];
}

class ChangePasswordEvent extends AuthEvent {
  const ChangePasswordEvent({
    required this.token,
    required this.email,
    required this.newPassword,
    required this.newPasswordConfirm,
  });

  final String token;

  final String email;

  final String newPassword;
  final String newPasswordConfirm;

  @override
  List<Object> get props => [
        token,
        email,
        newPassword,
        newPasswordConfirm,
      ];
}
