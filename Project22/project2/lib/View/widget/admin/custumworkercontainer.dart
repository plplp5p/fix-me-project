import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appcolors.dart';

class CustomWorkerAndContractorcontainer extends StatelessWidget {
  final String text;
  const CustomWorkerAndContractorcontainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(9)),
          color: Appcolors.lightblue),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
