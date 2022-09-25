import 'package:booking_app/features/auth/domain/entities/status.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class Data extends Equatable {
  const Data({required this.status, required this.user});

  final Status status;

  final User? user;


  Map<String , dynamic> toJson() => {} ;

  @override
  List<Object?> get props => [status, user];
}
