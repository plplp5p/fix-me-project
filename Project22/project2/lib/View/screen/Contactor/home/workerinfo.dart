// lib/View/screen/Contractor/worker_details.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Contractor/home/workerinfo_controller.dart';
import 'package:project2/View/widget/User/userprofile/userimage.dart';

class Workerinfo extends StatelessWidget {
  const Workerinfo({super.key});

  @override
  Widget build(BuildContext context) {
    WorkerInfoController controller = Get.put(WorkerInfoController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Worker Information",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child:
                      Align(alignment: Alignment.topLeft, child: UserImage()),
                ),
                const SizedBox(width: 60),
                Column(
                  children: [
                    Text(
                      "${controller.workerModel!.firstName}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${controller.workerModel!.userName}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 29,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${controller.workerModel!.workerEmail}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Text(
              "Reviews",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<WorkerInfoController>(builder: (controller) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.rateingData.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          color: Appcolors.white,
                          child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${controller.rateingData[i]["customer_username"]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  controller.ratingScore(
                                      controller.rateingData[i]['rate'])
                                ],
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "${controller.rateingData[i]['comment']}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              )),
                        ),
                      ],
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
