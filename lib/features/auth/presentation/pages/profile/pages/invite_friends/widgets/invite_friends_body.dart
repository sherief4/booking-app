import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/size_config.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class InviteFriendsBody extends StatelessWidget {
  const InviteFriendsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/other/invite.png',
          height: SizeConfig.screenWidth! * 0.85,
        ),
        const VerticalSpace(
          1.0,
        ),
        Center(
          child: Text(
            'Invite your friends',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const VerticalSpace(
          2.0,
        ),
        Center(
          child: Text(
            'Are you one of those who makes everything \nat the last moment',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const VerticalSpace(
          4.0,
        ),
        Container(
            width: 120.0,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10.0,),
            ),
            child: MaterialButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.share, color: Colors.white,),
                  SizedBox(width: 3.0,),
                  Text(
                    'Share',
                    style: TextStyle(color: Colors.white,

                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
