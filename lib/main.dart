import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teman_finansial_app/ui/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: HomeScreen(),
      );
    });
  }
}
