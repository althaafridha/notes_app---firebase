import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../view/edit_page_view.dart';

class EditPageController extends GetxController {
  EditPageView? view;

  late TextEditingController newTitleController;
  late TextEditingController newContentController;

  late String idNotes;

  @override
  void onInit() {
    newTitleController = TextEditingController();
    newContentController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<DocumentSnapshot<Object?>> getData(String idNotes) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('note').doc(idNotes);
    return await documentReference.get();
  }

  void updateData(String title, String content, String idNotes) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('note').doc(idNotes);
    var date = DateFormat('dd-MM-yyyy | kk:mm a').format(DateTime.now());
    try {
      await documentReference
          .update({'title': title, 'content': content, 'date': date});
      Get.back();
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: 'Tidak berhasil mengubah data',
      );
    }
  }

  void back() {
    Get.toNamed(Routes.HOME);
  }
}
