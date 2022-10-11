import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mevolve_hashtag/extensions/util_extensions.dart';
import 'package:mevolve_hashtag/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.hideKeyboard();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mevolve',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
