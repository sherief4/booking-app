import 'package:booking_app/features/hotels/data/models/facility_model.dart';
import 'package:booking_app/features/hotels/data/models/hotel_image_model.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required int id,
    required String name,
    required String description,
    required String price,
    required String address,
    required String longitude,
    required String latitude,
    required String rate,
    required List<HotelImageModel> hotelImages,
    required List<FacilityModel> hotelFacilities,
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          address: address,
          latitude: latitude,
          longitude: longitude,
          rate: rate,
          hotelFacilities: hotelFacilities,
          hotelImages: hotelImages,
        );

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    List<HotelImageModel> images = [];
    List<FacilityModel> facilities = [];
    if (json['hotel_images'] != null) {
      json['hotel_images'].forEach((data) {
        images.add(HotelImageModel.fromJson(data));
      });
    }
    if (json['hotel_facilities'] != null) {
      json['hotel_facilities'].forEach((data) {
        facilities.add(FacilityModel.fromJson(data));
      });
    }

    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      rate: json['rate'],
      hotelImages: images,
      hotelFacilities: facilities,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'rate': rate,
        'hotel_images': hotelImages!.map((e) => e.toJson()).toList(),
        'hotel_facilities': hotelFacilities!.map((e) => e.toJson()).toList(),
      };
}
