import 'package:booking_app/features/auth/presentation/pages/login/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const LoginBody(),
    );
  }
}
