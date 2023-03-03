import 'package:flutter/material.dart';
import 'package:note_app_firebase/core.dart';

class HomePageController extends State<HomePageView> implements MvcController {
  static late HomePageController instance;
  late HomePageView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void addNote() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const AddPageView()));
  }

  detailNote() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => DetailPageView(
                )));
  }
}
