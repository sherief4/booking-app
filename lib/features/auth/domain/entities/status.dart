import 'package:equatable/equatable.dart';

class Status extends Equatable {
  const Status({required this.type, required this.title});

  final String? title;
  final String? type;

  Map<String , dynamic> toJson() => {} ;

  @override
  List<Object?> get props => [title, type];
}
