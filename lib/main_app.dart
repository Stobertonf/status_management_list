import 'package:flutter/material.dart';
import 'package:status_management_list/app/pages/home/home_page.dart';
import 'package:status_management_list/app/pages/splash-screen/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
