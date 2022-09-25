// ignore_for_file: constant_identifier_names

import 'package:booking_app/core/errors/failures.dart';

const String CACHED_USER = 'CACHED_USER' ;

const String CACHED_BOOKINGS = 'CACHED_BOOKINGS';
const String CACHED_HOTELS = 'CACHED_Hotels';
const String CACHED_FACILITIES = 'CACHED_Facilities';



const String API_FAILURE_MESSAGE = "Please, try again later .";
const String EMPTY_CACHE_FAILURE_MESSAGE = "No Data";
const String OFFLINE_FAILURE_MESSAGE = "Please check your Internet Connection";

const ADD_SUCCESS_MESSAGE = "Post added successfully";
const DELETE_SUCCESS_MESSAGE = "Post deleted successfully";
const UPDATE_SUCCESS_MESSAGE = "Post updated successfully";


String mapFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ApiFailure:
      return API_FAILURE_MESSAGE;

    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;

    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;

    default:
      return "Unexpected failure, please try again later";
  }
}