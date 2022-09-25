import 'package:booking_app/features/auth/data/models/status_model.dart';
import 'package:booking_app/features/auth/data/models/user_model.dart';
import 'package:booking_app/features/auth/domain/entities/data.dart';

class DataModel extends Data {
  const DataModel({
    required StatusModel statusModel,
    UserModel? user,
  }) : super(user: user, status: statusModel);

  factory DataModel.fromJson(Map<String, dynamic> json) {
    UserModel? model =
        json['data'] != null ? UserModel.fromJson(json['data']) : null;
    return DataModel(
      statusModel: StatusModel.fromJson(json['status']),
      user: model,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = user != null ? user!.toJson() : null;
    return {
      'status': status.toJson(),
      'data': data,
    };
  }
}
