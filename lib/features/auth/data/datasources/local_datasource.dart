import 'dart:convert';
import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/auth/data/models/data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource {
  Future<DataModel> getCachedUser();

  Future<Unit> cacheUser({required DataModel dataModel});
}

class LocalDatasourceImpl implements LocalDatasource {
  const LocalDatasourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  Future<Unit> cacheUser({required DataModel dataModel}) {
    sharedPreferences.setString(CACHED_USER, json.encode(dataModel.toJson()));
    return Future.value(unit);
  }

  @override
  Future<DataModel> getCachedUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      Map<String, dynamic> decodedJsonData = json.decode(jsonString);
      DataModel model = DataModel.fromJson(decodedJsonData);
      return Future.value(model);
    } else {
      throw EmptyCacheException();
    }
  }
}
