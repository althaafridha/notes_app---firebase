import 'package:flutter/material.dart';
import 'package:note_app_firebase/core.dart';
import 'package:note_app_firebase/module/add_page/widget/MySeparator.dart';
import 'package:note_app_firebase/utils/utils.dart';
import '../controller/add_page_controller.dart';

class AddPageView extends StatefulWidget {
  const AddPageView({Key? key}) : super(key: key);

  Widget build(context, AddPageController controller, MySeparator separator) {
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
          'Add Note',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => controller.save(),
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
      body: SingleChildScrollView(
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
                      child: TextField(
                        controller: controller.titleController,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Input your Title",
                            hintStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
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
              // Row(
              //   children: const [
              //     Text(
              //       "Last Modified : ",
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //     Text(
              //       "controller.dateNow",
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.contentController,
                maxLines: 15,
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Input your notes here..",
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AddPageView> createState() => AddPageController();
}
