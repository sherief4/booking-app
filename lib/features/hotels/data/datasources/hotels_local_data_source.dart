import 'dart:convert';
import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/hotels/data/models/facility_model.dart';
import 'package:booking_app/features/hotels/data/models/hotel_data_model.dart';
import 'package:booking_app/features/hotels/data/models/hotel_model.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel_data.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HotelsLocalDatasource {
  Future<Unit> cacheHotels({required HotelDataModel hotels});
  Future<HotelDataModel> getCachedHotels();

  // Future<Unit> cacheBookings({required List<BookingModel> bookings});

  // Future<List<BookingModel>> getCachedBookings();

  // Future<Unit> cacheFacilities({required List<FacilityModel> facilities});
  //
  // Future<List<FacilityModel>> getCachedFacilities();
}

class HotelsLocalDatasourceImpl implements HotelsLocalDatasource {
  const HotelsLocalDatasourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;


  @override
  Future<Unit> cacheHotels({required HotelDataModel hotels}) {
    final modelToJson = hotels.toJson();
    sharedPreferences.setString(CACHED_HOTELS, json.encode(modelToJson));
    return Future.value(unit);
  }
  @override
  Future<HotelDataModel> getCachedHotels() {
    final jsonString = sharedPreferences.getString(CACHED_BOOKINGS);
    if (jsonString != null) {
      final decodedJson = json.decode(jsonString);
     final HotelDataModel data = HotelDataModel.fromJson(decodedJson);
      return Future.value(data);
    } else {
      throw EmptyCacheException();
    }
  }

  // @override
  // Future<Unit> cacheBookings({required List<BookingModel> bookings}) {
  //   List modelsToJson =
  //       bookings.map<Map<String, dynamic>>((e) => e.toJson()).toList();
  //   sharedPreferences.setString(CACHED_BOOKINGS, json.encode(modelsToJson));
  //   return Future.value(unit);
  // }

  // @override
  // Future<Unit> cacheFacilities({required List<FacilityModel> facilities}) {
  //   List modelsToJson =
  //       facilities.map<Map<String, dynamic>>((e) => e.toJson()).toList();
  //   sharedPreferences.setString(CACHED_FACILITIES, json.encode(modelsToJson));
  //   return Future.value(unit);
  // }

  // @override
  // Future<List<BookingModel>> getCachedBookings() {
  //   final jsonString = sharedPreferences.getString(CACHED_BOOKINGS);
  //   if (jsonString != null) {
  //     List decodedJson = json.decode(jsonString);
  //     List<BookingModel> jsonToModels = decodedJson
  //         .map<BookingModel>((e) => BookingModel.fromJson(e))
  //         .toList();
  //     return Future.value(jsonToModels);
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }
  //
  // @override
  // Future<List<FacilityModel>> getCachedFacilities() {
  //   final jsonString = sharedPreferences.getString(CACHED_BOOKINGS);
  //   if (jsonString != null) {
  //     List decodedJson = json.decode(jsonString);
  //     List<FacilityModel> jsonToModels = decodedJson
  //         .map<FacilityModel>((e) => FacilityModel.fromJson(e))
  //         .toList();
  //     return Future.value(jsonToModels);
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }


}
