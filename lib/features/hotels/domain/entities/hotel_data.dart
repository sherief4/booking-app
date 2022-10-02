import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:equatable/equatable.dart';

class HotelData extends Equatable {
  const HotelData({
    this.status,
    this.hotels,
  });

  final String? status;
  final List<Hotel>? hotels;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [
        status,
        hotels,
      ];
}
