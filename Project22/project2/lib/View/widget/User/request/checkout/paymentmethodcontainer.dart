import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class PaymentMethodContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? color;
  final bool active;
  const PaymentMethodContainer(
      {super.key,
      required this.text,
      this.icon,
      this.color,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                width: active == true ? 2 : 1, color: Appcolors.black)),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                      active == true ? FontWeight.bold : FontWeight.normal),
            ),
            const SizedBox(
              width: 175,
            ),
            Icon(
              icon,
              color: color,
            )
          ],
        ));
  }
}
