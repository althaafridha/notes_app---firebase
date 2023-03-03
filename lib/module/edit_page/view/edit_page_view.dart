import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

// import 'package:note_app_firebase/core.dart';
import 'package:get/get.dart';

import '../../add_page/widget/MySeparator.dart';
import '../controller/edit_page_controller.dart';

class EditPageView extends StatelessWidget {
  const EditPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditPageController>(
      init: EditPageController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    color: const Color(0xff828282),
                  )),
            ),
            title: const Text(
              'Edit Note',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => controller.updateData(
                      controller.newTitleController.text,
                      controller.newContentController.text,
                      Get.arguments),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: FutureBuilder<DocumentSnapshot<Object?>>(
              future: controller.getData(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  controller.newTitleController.text = data['title'];
                  controller.newContentController.text = data['content'];
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Title :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: boxDecoration,
                                  child: TextFormField(
                                    controller: controller.newTitleController,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Input your Title",
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const MySeparator(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controller.newContentController,
                            maxLines: 15,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Input your notes here..",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        );
      },
    );
  }
}
