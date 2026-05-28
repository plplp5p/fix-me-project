import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/Base/constant/appcolors.dart';

class ProfileContainers extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const ProfileContainers({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Appcolors.black,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )));
  }
}
