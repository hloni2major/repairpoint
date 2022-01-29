import 'package:flutter/material.dart';
import 'package:repointment/ui/home_screen.dart';
import 'package:repointment/utils/create_material_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MaterialColor primary = createMaterialColor(const Color(0xFF50514F));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: const HomeView(),
    );
  }
}
