import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Controllers/User/userprofile_controller.dart';

class Usernameandfirstname extends StatelessWidget {
  const Usernameandfirstname({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileController controller = Get.put(UserProfileController());
    return Column(
      children: [
        Text(
          "${controller.firstname}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${controller.username}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
