import 'package:booking_app/features/hotels/data/models/hotel_image_model.dart';
import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  const Hotel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.address,
    this.longitude,
    this.latitude,
    this.rate,
    this.hotelImages,
    this.hotelFacilities,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? address;
  final String? longitude;
  final String? latitude;
  final String? rate;
  final List<HotelImageModel>? hotelImages;
  final List<Facility>? hotelFacilities;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        address,
        latitude,
        longitude,
        rate,
      ];
}
