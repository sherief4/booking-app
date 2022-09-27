import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
class EditFieldTile extends StatelessWidget {
  const EditFieldTile({Key? key, required this.title, required this.controller}) : super(key: key);
final String title;
final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Row(
          children: [
            Text(
             title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            SizedBox(
              height: 60.0,
              width: 250.0,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.withOpacity(0.4),
          height: 1.0,
        ),
      ],
    );
  }
}
