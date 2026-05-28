import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSearchandName extends StatelessWidget {
  final void Function()? onPressed;
  const HomeSearchandName({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "Fixme".tr,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.search,
            size: 37,
          ))
    ]);
  }
}
