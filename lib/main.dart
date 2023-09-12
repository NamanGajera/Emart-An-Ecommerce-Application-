// ignore_for_file: unrelated_type_equality_checks
import 'package:emart/widgets/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Emart());
}

class Emart extends StatelessWidget {
  Emart({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
