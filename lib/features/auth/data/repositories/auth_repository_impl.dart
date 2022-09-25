import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/data/datasources/remote_datasource.dart';
import 'package:booking_app/features/auth/domain/entities/data.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  final RemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Unit>> changePassword(
      {required String password,
      required String passwordConfirm,
      required String token,
      required String email}) async {
    if (await networkInfo.isConnected) {
      await remoteDatasource.changePassword(
          password: password,
          passwordConfirm: passwordConfirm,
          token: token,
          email: email,);
      return const Right(unit);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Data>> getProfileInfo() async {
    try {
      final localData = await localDatasource.getCachedUser();
      return Right(localData);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Data>> login(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      final data =
          await remoteDatasource.login(email: email, password: password);
      await localDatasource.cacheUser(dataModel: data);
      return Right(data);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Data>> registerUser(
      {required String email,
      required String password,
      required String name,
      required String passwordConfirm}) async {
    if (await networkInfo.isConnected) {
      final data = await remoteDatasource.registerUser(
          email: email,
          password: password,
          passwordConfirm: passwordConfirm,
          name: name);
      await localDatasource.cacheUser(dataModel: data);
      return Right(data);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Data>> updateProfileInfo(
      {required String email,
      required String token,
      required String name,
      required String image}) async {
    if (await networkInfo.isConnected) {
      final data = await remoteDatasource.updateProfile(
          email: email, token: token, name: name, image: image);
      await localDatasource.cacheUser(dataModel: data);
      return Right(data);
    } else {
      return Left(OfflineFailure());
    }

  }
}
