// ignore_for_file: file_names, non_constant_identifier_names
import 'package:emart/category_pages/Clothing.dart';
import 'package:flutter/material.dart';
import '../BottomNavPage/About.dart';
import '../BottomNavPage/Cart.dart';
import '../BottomNavPage/History.dart';
import '../BottomNavPage/Home.dart';
import 'FavoritePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final _pages = [
  const Home(),
  const Cart(),
  const History(),
  const About(),
];

class _HomePageState extends State<HomePage> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 232, 232),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'images/profile.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Name Of User',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Text('Catagories'),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Text('About'),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Text('Setting'),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Text('Log Out'),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.sort,
                  size: 32,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text(
            'E Mart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FavoritePage();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: _pages[SelectedIndex],
        ),
        //Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFF4C53A5),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'About',
            ),
          ],
          currentIndex: SelectedIndex,
          onTap: ((setvalue) {
            setState(() {
              SelectedIndex = setvalue;
            });
          }),
        ),
      ),
    );
  }
}
