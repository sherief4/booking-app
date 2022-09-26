import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class TileButton extends StatelessWidget {
  const TileButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0,),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Icon(
                  icon,
                  color: Colors.grey.withOpacity(0.4),
                  size: 32.0,
                )
              ],
            ),
          ),
          const VerticalSpace(
            1,
          ),
           Divider(
            color: Colors.grey.withOpacity(0.4),
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
