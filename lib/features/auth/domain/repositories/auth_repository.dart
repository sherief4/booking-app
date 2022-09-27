import 'dart:io';
import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/data.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Data>> registerUser({
    required String email,
    required String password,
    required String name,
    required String passwordConfirm,
  });

  Future<Either<Failure, Data>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Data>> getProfileInfo();

  Future<Either<Failure, Data>> updateProfileInfo({
    required String email,
    required String token,
    required String name,
    required File image ,
  });

  Future<Either<Failure, Unit>> changePassword({
    required String password,
    required String passwordConfirm,
    required String token,
    required String email,
  });

}
