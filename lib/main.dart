import 'package:flutter/material.dart';
import 'main_pages/Home_Page.dart';

void main() {
  runApp(const Emart());
}

class Emart extends StatelessWidget {
  const Emart({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
