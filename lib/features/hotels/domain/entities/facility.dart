import 'package:equatable/equatable.dart';

class Facility extends Equatable {
  const Facility({
    this.id,
    this.hotelId,
    this.facilityId,
  });

  final int? id;
  final String? hotelId;
  final String? facilityId;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [id, hotelId, facilityId];
}
