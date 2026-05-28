import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class AddressContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final bool active;
  final void Function()? onTap;
  const AddressContainer(
      {super.key,
      required this.text1,
      required this.text2,
      required this.active,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                width: active == true ? 2 : 1, color: Appcolors.black),
            borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          title: Text(
            text1,
            style: TextStyle(
                fontSize: 22,
                fontWeight:
                    active == true ? FontWeight.bold : FontWeight.normal),
          ),
          subtitle: Text(text2),
        ),
      ),
    );
  }
}
