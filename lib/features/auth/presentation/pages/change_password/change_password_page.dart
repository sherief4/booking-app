import 'package:booking_app/features/auth/presentation/pages/change_password/widgets/change_password_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:AppBar(),
    body: const ChangePasswordBody(),
    );
  }
}
