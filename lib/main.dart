import 'package:flutter/material.dart';
import 'package:technewsapp/components/searchbox.dart';
import 'package:technewsapp/pages/home.dart';
import 'package:technewsapp/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Searchbox(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        brightness: .dark
      ),
    );
  }
}
