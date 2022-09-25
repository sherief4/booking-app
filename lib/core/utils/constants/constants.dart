import 'package:flutter/material.dart';

void navigateTo({required BuildContext context, required Widget route}) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => route),
  );
}

void navigateAndFinish({required BuildContext context, required Widget route}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => route,
    ),
    (route) => false,
  );
}

showSnackBar({
  required BuildContext context,required String text,
  required Color textColor,
}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Text(
          text,
          style:  TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      elevation: 10.0,
    ),
  )
      .close;
}