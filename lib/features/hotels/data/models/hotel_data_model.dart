import 'package:booking_app/features/hotels/data/models/hotel_model.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel_data.dart';

class HotelDataModel extends HotelData {
  const HotelDataModel({
    final String? status,
    final List<HotelModel>? hotels,
  }) : super(
          status: status,
          hotels: hotels,
        );

  factory HotelDataModel.fromJson(Map<String, dynamic> json) {
    List<HotelModel> hotels = [];
    if (json['data']['data'] != null) {
      json['data']['data'].forEach((v) {
        hotels.add(HotelModel.fromJson(v));
      });
    }
    return HotelDataModel(
      status: json['status']['type'],
      hotels: hotels,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'status': status,
        'data' 'data': hotels!.map((e) => e.toJson()).toList(),
      };
}
