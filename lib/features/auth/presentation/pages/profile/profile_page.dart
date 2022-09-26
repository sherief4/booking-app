import 'package:booking_app/features/auth/presentation/pages/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileBody()),
    );
  }
}
