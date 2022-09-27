import 'package:booking_app/features/auth/presentation/pages/edit_profile/widgets/edit_profile_body.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:const EditProfileBody(),
    );
  }
}
