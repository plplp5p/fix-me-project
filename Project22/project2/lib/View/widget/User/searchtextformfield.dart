import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/User/search_controller.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    UserSearchController controller = Get.put(UserSearchController());
    return TextFormField(
      controller: controller.username,
      validator: (value) {
        return validateInput(value!);
      },
      onChanged: controller.onChangeusername,
      decoration: InputDecoration(
          hintText: "Search",
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: IconButton(
              onPressed: () {
                controller.getUsers();
              },
              icon: const Icon(Icons.search)),
          contentPadding: const EdgeInsets.all(20)),
    );
  }
}
