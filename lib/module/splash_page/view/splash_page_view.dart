import 'package:flutter/material.dart';
import 'package:note_app_firebase/core.dart';
import '../controller/splash_page_controller.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({Key? key}) : super(key: key);

  Widget build(context, SplashPageController controller) {
    controller.view = this;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.note_add_rounded, size: 75, color: Colors.blue),
            SizedBox(height: 10),
            Text("Note App Firebase", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500)),
          ],
        ),
      )
    );
  }

  @override
  State<SplashPageView> createState() => SplashPageController();
}