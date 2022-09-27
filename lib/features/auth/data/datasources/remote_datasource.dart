import 'dart:convert';
import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:booking_app/features/auth/data/models/data_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class RemoteDatasource {
  Future<DataModel> registerUser({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
  });

  Future<DataModel> login({
    required String email,
    required String password,
  });


  Future<DataModel> updateProfile({
    required String email,
    required String token,
    required String name,
    required File image,
  });

  Future<Unit> changePassword({
    required String password,
    required String passwordConfirm,
    required String token,
    required String email,
  });
}

class RemoteDatasourceImpl implements RemoteDatasource {
 const  RemoteDatasourceImpl({required this.client});

  final http.Client client;

  @override
  Future<DataModel> registerUser(
      {required String email,
      required String password,
      required String name,
      required String passwordConfirm}) async {
    final response = await client.post(
        Uri.parse(
          '$BASE_URL$VERSION$REGISTER',
        ),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirm,
        });
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      DataModel data = DataModel.fromJson(decodedJson);
      return data;
    }
    throw ApiException();
  }

  @override
  Future<DataModel> login(
      {required String email, required String password}) async {
    final response = await client.post(
        Uri.parse(
          '$BASE_URL$VERSION$LOGIN',
        ),
        body: {
          'email': email,
          'password': password,
        });
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      DataModel data = DataModel.fromJson(decodedJson);
      return data;
    }
    throw ApiException();
  }

  @override
  Future<Unit> changePassword(
      {required String password,
      required String passwordConfirm,
      required String token,
      required String email,}) async {
    final response = await client.post(
      Uri.parse('$BASE_URL$VERSION$PASSWORD_CHANGE'),
      body: {
        "password": password,
        "password_confirmation": passwordConfirm,
        "email": email,
      },
      headers: {
        "token": token,
      },
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    }
    throw ApiException();
  }

  @override
  Future<DataModel> updateProfile({
    required String email,
    required String token,
    required String name,
    required File image,
  }) async {
    final response = await client.post(
        Uri.parse(
          '$BASE_URL$VERSION$UPDATE_INFO',
        ),
        headers: {
          'token': token,
        },
        body: {
          "email": email,
          "name": name,
          "image": image,
        });
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      DataModel data = DataModel.fromJson(decodedJson['data']);
      return data;
    }
    throw ApiException();
  }
}

