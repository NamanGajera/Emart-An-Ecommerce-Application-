// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

import '../category_pages/Beauty.dart';
import '../category_pages/Clothing.dart';
import '../category_pages/Electronics.dart';
import '../category_pages/FootWear.dart';
import '../category_pages/Furniture.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: non_constant_identifier_names
  List<String> Item = [
    'clothing',
    'footwear',
    'Electronics',
    'beauty',
    'furniture'
  ];
  // ignore: non_constant_identifier_names
  final _CategoryPage = [
    Clothing(),
    const FootWear(),
    const Electronics(),
    const Beauty(),
    const Furniture(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          // TabBar for category
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: Item.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((ctx, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: 90,
                        height: 45,
                        decoration: BoxDecoration(
                            border: current == index
                                ? Border.all(
                                    color: const Color(0xFF4C53A5),
                                    width: 1.5,
                                  )
                                : null,
                            borderRadius: current == index
                                ? BorderRadius.circular(15)
                                : BorderRadius.circular(10),
                            color: current == index
                                ? const Color.fromARGB(137, 255, 255, 255)
                                : Colors.white),
                        child: Center(
                          child: Text(
                            Item[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  current == index ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Small dot
                    Visibility(
                      visible: current == index,
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          // showing diffrent item here
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: _CategoryPage[current],
            ),
          ),
        ],
      ),
    );
  }
}
