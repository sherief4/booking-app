import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
        required this.onPressed,
      required this.color,
      required this.textColor,
      required this.text})
      : super(key: key);
  final Color color;
  final Color textColor;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18.0,
            fontFamily: 'Josefin',
          ),
        ),

      ),
    );
  }
}
