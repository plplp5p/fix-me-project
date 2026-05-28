import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/constant/appimages.dart';
import 'package:project2/View/widget/shared/customlargetext.dart';
import 'package:project2/textchat_controller.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomechatController());
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: ListView(children: [
              Center(
                child: CustomLargeText(
                  text: "My Chat".tr,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(children: [
                GetBuilder<HomechatController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.users.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        var user = controller.users[i];
                        var chatId = user.chatId;
                        var lastMessage =
                            controller.lastMessages[chatId] ?? 'Loading...';
                        var unreadCount =
                            controller.unreadCounts[chatId]?.toString() ?? "0";

                        return Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                controller.readTheMessages(chatId!);
                                var result =
                                    await Get.toNamed("chat1", arguments: {
                                  "chat_id": chatId,
                                  "user_name": controller.username,
                                  "worker_username": user.workerUsername
                                });
                                if (result != null) {}
                              },
                              child: ListTile(
                                leading: Image.asset(Appimages.userProfile),
                                title: Text(
                                  "${user.workerUsername}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      lastMessage,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    if (unreadCount != "0")
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Appcolors.primaryColor,
                                        child: Text(
                                          unreadCount,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              color: Appcolors.black,
                            ),
                          ],
                        );
                      });
                })
              ])
            ])));
  }
}
