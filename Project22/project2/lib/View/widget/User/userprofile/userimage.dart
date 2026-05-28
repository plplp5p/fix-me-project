import 'package:flutter/widgets.dart';
import 'package:project2/Base/constant/appimages.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
      Appimages.userProfile,
      width: 70,
      height: 70,
    ));
  }
}
