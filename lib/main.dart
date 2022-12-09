import 'package:flutter/material.dart';
import 'package:movie_app_blastoff/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DEMO',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

