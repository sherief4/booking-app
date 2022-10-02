
import 'package:booking_app/features/hotels/domain/entities/hotel_image.dart';

class HotelImageModel extends HotelImage {
  const HotelImageModel({
    required int id,
    required String hotelId,
    required String image,
  }) : super(
          id: id,
          hotelId: hotelId,
          image: image,
        );

  factory HotelImageModel.fromJson(Map<String, dynamic> json) {
    return HotelImageModel(
        id: json['id'], hotelId: json['hotel_id'], image: json['image']);
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'hotel_id': hotelId,
        'image': image,
      };

}
