import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:note_app_firebase/core.dart';
import 'package:get/get.dart';
import 'package:note_app_firebase/routes/app_pages.dart';

import '../controller/home_page_controller.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  Widget build(context, HomePageController controller) {
    controller.view = this;

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("note").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAIL, arguments: data.id),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff000000).withOpacity(0.16),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data["title"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24), maxLines: 2, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 10),
                              Text("at ${data["date"]}", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                              const SizedBox(height: 10),
                              Text(data["content"], maxLines: 5, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 250),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addNote();
          },
          child: const Icon(Icons.add),
        ));
  }

  @override
  State<HomePageView> createState() => HomePageController();
}
