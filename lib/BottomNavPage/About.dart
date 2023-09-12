import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text(
            'About Page',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 250,
          ),
          Center(
            child: Text(
              'Coming Soon!!!',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(31, 48, 47, 47)),
            ),
          ),
        ],
      ),
    );
  }
}
