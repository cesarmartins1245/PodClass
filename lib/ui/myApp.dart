// ignore_for_file: prefer_const_constructors

import 'package:audio_teste/ui/home_page/home.dart';
import 'package:audio_teste/ui/teste/teste.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FireBasePage(),
    );
  }
}
