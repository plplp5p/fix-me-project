import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/funcation/validateinput.dart';
import 'package:project2/Controllers/Contractor/home/searchpage_controller.dart';

class ContractorSearchTextFormField extends StatelessWidget {
  const ContractorSearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    ContractorSearchController controller = Get.put(ContractorSearchController());
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
