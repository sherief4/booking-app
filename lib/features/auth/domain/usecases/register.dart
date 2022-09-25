import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/data.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  const RegisterUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, Data>> call({
    required String email,
    required String password,
    required String name,
    required String passwordConfirm,
  }) async {
    return await repository.registerUser(
      email: email,
      passwordConfirm: passwordConfirm,
      password: password,
      name: name,
    );
  }
}
