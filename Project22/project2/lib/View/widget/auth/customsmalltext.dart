import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class CustomSmallText extends StatelessWidget {
  final String? text;
  const CustomSmallText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Appcolors.black));
  }
}
