import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/data.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfileInfoUseCase {
  const GetProfileInfoUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, Data>> call() async {
    return await repository.getProfileInfo();
  }
}
