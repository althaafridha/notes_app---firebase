import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:note_app_firebase/core.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/utils.dart';
import 'package:get/get.dart';
import '../../add_page/widget/MySeparator.dart';
import '../controller/detail_page_controller.dart';

class DetailPageView extends StatefulWidget {
  const DetailPageView({
    Key? key,
  }) : super(key: key);

  Widget build(
      context, DetailPageController controller, MySeparator separator) {
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
            'Detail Note',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () =>
                    {controller.showAlertDialog(context, Get.arguments)},
                child: const Text(
                  "Delete",
                  style: TextStyle(
                      color: Colors.red,
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
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                padding: const EdgeInsets.all(15),
                                decoration: boxDecoration,
                                child: Text(
                                  snapshot.data!['title'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Last Modified : ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              snapshot.data!['date'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            )
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
                        Text(
                          snapshot.data!['content'],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.EDIT, arguments: Get.arguments);
            print(Get.arguments);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.edit),
        ));
  }

  @override
  State<DetailPageView> createState() => DetailPageController();
}
