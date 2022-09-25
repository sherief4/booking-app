import 'package:booking_app/features/auth/domain/entities/status.dart';

class StatusModel extends Status{
  const StatusModel({
    required String title,
    required String type,
}) :super(
    type: type,
    title: title,
  );

  factory StatusModel.fromJson(Map<String , dynamic> json){
    return StatusModel(title: json['title']['en'], type:json['type']);
  }
  @override
  Map<String , dynamic> toJson(){
    return {
      'type' : type,
      'title' :{
        'en' : title,
      }
    };
  }
}