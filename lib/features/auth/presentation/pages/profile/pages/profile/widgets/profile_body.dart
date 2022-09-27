import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booking_app/features/auth/presentation/pages/change_password/change_password_page.dart';
import 'package:booking_app/features/auth/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:booking_app/features/auth/presentation/pages/profile/pages/help/help_page.dart';
import 'package:booking_app/features/auth/presentation/pages/profile/pages/invite_friends/invite_friends_page.dart';
import 'package:booking_app/features/auth/presentation/pages/profile/pages/profile/widgets/tile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is GetProfileSuccessState || AuthBloc.get(context).data != null) {
        return Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  navigateTo(context: context, route: const EditProfilePage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${AuthBloc.get(context).data!.user!.name}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const VerticalSpace(
                            0.5,
                          ),
                          Text(
                            'View and edit profile',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 36.0,
                        backgroundColor: mainColor,
                        child: CircleAvatar(
                          radius: 32.0,
                          backgroundColor: backgroundColor,
                          backgroundImage: NetworkImage(
                            'https://static.wikia.nocookie.net/thelastofus/images/5/50/Ellie_Jackson_shoulder_infobox.jpg/revision/latest?cb=20201121211251',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpace(
                3.0,
              ),
              TileButton(
                title: 'Change Password',
                onTap: () {
                  navigateTo(
                      context: context, route: const ChangePasswordPage());
                },
                icon: Icons.lock,
              ),
              TileButton(
                title: 'Invite Friend',
                onTap: () {
                  navigateTo(context: context, route: const InviteFriendsPage());
                },
                icon: Icons.people,
              ),
              TileButton(
                title: 'Help Center',
                onTap: () {
                  navigateTo(context: context, route: const HelpPage());
                },
                icon: Icons.info_outlined,
              ),
              TileButton(
                title: 'Payment',
                onTap: () {},
                icon: Icons.account_balance_wallet_sharp,
              ),
              const VerticalSpace(
                8.0,
              ),
              DefaultButton(
                  onPressed: () {},
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  text: 'Log out',),
            ],
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
