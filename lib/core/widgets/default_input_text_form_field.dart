import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPassword,
    this.keyboardType,
  }) : super(key: key);
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const VerticalSpace(
          1.0,
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey.withOpacity(0.2),
            ),
          ]),
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            obscureText: isPassword ?? false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 16.0,
              ),
              fillColor: Colors.white.withOpacity(
                0.8,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),

              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
