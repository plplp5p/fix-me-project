import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:get/get.dart';

class CustomtPageButton extends StatelessWidget {
  final void Function()? onPressed;
  final String pagetext;
  final IconData iconData;
  final bool active;
  const CustomtPageButton(
      {super.key,
      this.onPressed,
      required this.pagetext,
      required this.iconData,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Icon(
              iconData,
              color: active == true ? Appcolors.primaryColor : Colors.black,
            ),
          ),
          Text(
            pagetext.tr,
            style: TextStyle(
                color: active == true ? Appcolors.primaryColor : Colors.black,
                fontSize: active == true ? 16 : 14,
                fontWeight:
                    active == true ? FontWeight.bold : FontWeight.normal),
          )
        ],
      ),
    );
  }
}
