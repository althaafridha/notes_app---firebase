import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app_firebase/core.dart';
import 'package:note_app_firebase/state_util.dart';

class SplashPageController extends State<SplashPageView>
    implements MvcController {
  static late SplashPageController instance;
  late SplashPageView view;

  @override
  void initState() {
    instance = this;
    super.initState();

   Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePageView()));
    });
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
