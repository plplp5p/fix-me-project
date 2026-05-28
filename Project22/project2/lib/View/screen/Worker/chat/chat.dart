import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Controllers/Worker/chat/workerchat_controller.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatMessagesController controller = Get.put(ChatMessagesController());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        title: Text(
          "${controller.customerUername}",
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ChatMessagesController>(
              builder: (controller) {
                WidgetsBinding.instance.addPostFrameCallback((scroll) {
                  controller.scroll();
                });
                return ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.messageList().length,
                  itemBuilder: (context, i) {
                    Widget pageWidget = controller.messageList()[i];
                    return pageWidget; 
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.text,
                    decoration: const InputDecoration(
                      hintText: "Message...",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Appcolors.black),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Appcolors.black),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Appcolors.black),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Appcolors.primaryColor,
                  ),
                  onPressed: () {
                    controller.sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
