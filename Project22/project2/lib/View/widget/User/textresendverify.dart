import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/Base/constant/appcolors.dart';

class TextResendVerify extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const TextResendVerify({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Appcolors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ));
  }
}
