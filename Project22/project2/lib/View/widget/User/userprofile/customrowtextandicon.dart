import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomRowTextAndIcon extends StatelessWidget {
  final String text;
  final IconData? icon;
  const CustomRowTextAndIcon({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(
          text.tr,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
