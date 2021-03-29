import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_passord/view/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: StartPage());
  }
}
