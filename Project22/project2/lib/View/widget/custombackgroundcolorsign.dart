import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class CustomBackgroundColorsign extends StatelessWidget {
  final Widget? child;
  const CustomBackgroundColorsign({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration:const BoxDecoration(
          gradient: LinearGradient(
              colors: [Appcolors.backgroundColor, Appcolors.white],
              begin: Alignment.topCenter,
              end:  Alignment(0, 0))),
      child: child,
    );
  }
}
