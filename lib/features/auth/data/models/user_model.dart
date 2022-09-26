import 'package:booking_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required int id,
    required String name,
    required String email,
    required String token,
    required String image,
  }) : super(
          id: id,
          name: name,
          email: email,
          image: image,
          token: token,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'] ?? 'https://cdn-icons-png.flaticon.com/512/1077/1077063.png?w=740&t=st=1664196180~exp=1664196780~hmac=12c8cfe8b75d3433693f253436806b4db495998299560a2ef6ee9afbc4ff1400' ,
      token: json['api_token'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'api_token' : token,
    };
  }
}
