import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_firebase/state_util.dart';
import '../../add_page/widget/MySeparator.dart';
import '../../home_page/view/home_page_view.dart';
import '../view/detail_page_view.dart';
import 'package:get/get.dart';

class DetailPageController extends State<DetailPageView>
    implements MvcController {
  static late DetailPageController instance;
  late DetailPageView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) =>
      widget.build(context, this, const MySeparator());

  void back() {
    Navigator.pop(context);
  }

  Future<DocumentSnapshot<Object?>> getData(String idNotes) async {
    return await FirebaseFirestore.instance
        .collection('note')
        .doc(idNotes)
        .get();
  }


  showAlertDialog(BuildContext context, String idNotes) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () async {
        await FirebaseFirestore.instance
            .collection('note')
            .doc(idNotes)
            .delete();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomePageView()));
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Delete Note"),
      content: const Text("Are you sure you want to delete this note?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
