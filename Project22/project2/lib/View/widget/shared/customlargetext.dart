import 'package:flutter/material.dart';

class CustomLargeText extends StatelessWidget {
  final String? text;
  const CustomLargeText({super.key,  required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: Theme.of(context).textTheme.headlineLarge);
  }
}
