import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class ForegetpasswordText extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const ForegetpasswordText({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            text ,
            style: const TextStyle(
                color: Appcolors.black,
                fontWeight: FontWeight.normal,
                fontSize: 17),
          ),
        ),
      ],
    );
  }
}
