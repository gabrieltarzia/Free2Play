import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/homeView/home.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
