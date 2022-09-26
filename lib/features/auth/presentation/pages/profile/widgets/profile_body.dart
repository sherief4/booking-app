import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booking_app/features/auth/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:booking_app/features/auth/presentation/pages/profile/widgets/tile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const GetProfileEvent());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetProfileSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    navigateTo(
                        context: context, route: const EditProfilePage());
                  },
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.data.user!.name}',
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
                            'https://cdn-icons-png.flaticon.com/512/1077/1077063.png?w=740&t=st=1664196180~exp=1664196780~hmac=12c8cfe8b75d3433693f253436806b4db495998299560a2ef6ee9afbc4ff1400',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(
                  3.0,
                ),
                TileButton(
                  title: 'Change Password',
                  onTap: () {},
                  icon: Icons.lock,
                ),
                TileButton(
                  title: 'Invite Friend',
                  onTap: () {},
                  icon: Icons.people,
                ),
                TileButton(
                  title: 'Help Center',
                  onTap: () {},
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
                    text: 'Log out')
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
