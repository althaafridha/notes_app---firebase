import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app_firebase/core.dart';
import 'package:note_app_firebase/module/add_page/widget/MySeparator.dart';
import 'package:note_app_firebase/state_util.dart';
import '../view/add_page_view.dart';

class AddPageController extends State<AddPageView> implements MvcController {
  static late AddPageController instance;
  late AddPageView view;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      widget.build(context, this, const MySeparator());

  void back() {
    Navigator.pop(context);
  }

  void addNote() {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill all the fields'),
      ));
    }
  }

  save() async {
    var title = titleController.text;
    var content = contentController.text;
    var date = DateFormat('dd-MM-yyyy | kk:mm a').format(DateTime.now());

    await FirebaseFirestore.instance.collection('note').add({
      'title': title,
      'content': content,
      'date': date,
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const HomePageView()));
  }
}
