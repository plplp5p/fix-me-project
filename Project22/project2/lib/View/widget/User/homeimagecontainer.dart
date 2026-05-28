import 'package:flutter/material.dart';
import 'package:project2/Base/constant/appimages.dart';

class HomeImageContainer extends StatelessWidget {
  const HomeImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          Appimages.homeImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
