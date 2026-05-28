import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class CustomContainerCircular extends StatelessWidget {
  final void Function()? onTap;
  const CustomContainerCircular({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Appcolors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.grid_view_rounded,
          color: Appcolors.white,
          size: 26,
        ),
      ),
    );
  }
}
