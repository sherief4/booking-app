import 'package:booking_app/features/auth/presentation/pages/profile/pages/invite_friends/widgets/invite_friends_body.dart';
import 'package:flutter/material.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const InviteFriendsBody(),
    );
  }
}
