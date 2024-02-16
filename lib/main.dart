import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapi/pages/home.dart';
import 'package:getxapi/pages/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GetX",
      theme: ThemeData(scaffoldBackgroundColor: Colors.deepPurple[100], primarySwatch: Colors.deepPurple),
      home: TodoPage(),
    );
  }
}
