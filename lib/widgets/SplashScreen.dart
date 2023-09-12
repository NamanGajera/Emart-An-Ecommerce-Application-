// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:emart/main_pages/Home_Page.dart';
import 'package:emart/main_pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BottomNavPage/Cart.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Navigatortohome();
    super.initState();
  }

  Navigatortohome() async {
    var sharedPref = await SharedPreferences.getInstance();
    var IsLoggedin = sharedPref.getBool(CartState.KEYLOGIN);
    await Future.delayed(Duration(milliseconds: 1500));
    if (IsLoggedin != null) {
      if (IsLoggedin) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const HomePage())));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const LoginPage())));
      }
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LoginPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 300),
          Text(
            'WelCome',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'To',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'E Mart',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
          SizedBox(height: 40),
        ],
      ),
    ));
  }
}
