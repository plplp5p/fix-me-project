import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class CustomSingorLogin extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomSingorLogin({super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(color: Appcolors.black, fontSize: 16),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
                color: Appcolors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
