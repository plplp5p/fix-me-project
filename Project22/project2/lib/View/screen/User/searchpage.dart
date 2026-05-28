import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/User/search_controller.dart';
import 'package:project2/View/widget/User/searchtextformfield.dart';
import 'package:project2/View/widget/User/workerlistsearch.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserSearchController());
    return Scaffold(
        backgroundColor: Appcolors.white,
        body: GetBuilder<UserSearchController>(
          builder: (controller) {
            return Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 40),
                child: Form(
                    key: controller.mykey1,
                    child: Column(children: [
                      const SearchTextFormField(),
                      controller.userfound == false
                          ? Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: const Text(
                                "User Not Found",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : WorkerListSearch(
                              workers: controller.workersList,
                            )
                    ])));
          },
        ));
  }
}
