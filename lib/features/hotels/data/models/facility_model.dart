import 'package:booking_app/features/hotels/domain/entities/facility.dart';

class FacilityModel extends Facility {
  const FacilityModel({
    required int id,
    required String hotelId,
    required String facilityId,
  }) : super(
          id: id,
          hotelId: hotelId,
          facilityId: facilityId,
        );

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json['id'],
      hotelId: json['hotel_id'],
      facilityId: json['facility_id'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'hotel_id': hotelId,
        'facility_id': facilityId,
      };
}
