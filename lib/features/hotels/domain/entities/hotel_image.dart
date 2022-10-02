import 'package:equatable/equatable.dart';

class HotelImage extends Equatable {
  const HotelImage({
    this.id,
    this.hotelId,
    this.image,
  });

  final int? id;
  final String? hotelId;
  final String? image;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [id, hotelId, image];
}
