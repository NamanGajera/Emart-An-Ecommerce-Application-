// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, constant_identifier_names

import 'dart:async';

import 'package:emart/consts/List.dart';
import 'package:emart/main_pages/LoginPage.dart';
import 'package:emart/widgets/CheckOut.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => CartState();
}

class CartState extends State<Cart> {
  int itemcount = CartItemImage.length;
  int sum = 0;
  List<bool> selected = <bool>[];
  static const String KEYLOGIN = "Login";
  @override
  initState() {
    for (var i = 0; i < itemcount; i++) {
      selected.add(false);
    }
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count = CartItemName.length;
    int sum = 0;
    for (int i = 0; i < count; i++) {
      sum = sum + int.parse(CartItemPrice[i]);
    }
    ;
    String CheckOutPrice = sum.toString();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Your Cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: CartItemName.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 140,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            //Image of Item
                            SizedBox(
                              height: 135,
                              width: 105,
                              child: Center(
                                child: Image.asset(
                                  CartItemImage[index],
                                ),
                              ),
                            ),
                            //Details of Item
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                //item Brand Name
                                Text(
                                  CartItemBrandName[index],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                //Item Name
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        CartItemName[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),

                                const Spacer(),
                                //Item Price
                                Text(
                                  '\u{20B9} ${CartItemPrice[index]}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const Spacer(flex: 3),
                            //Remove Item Icon
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  size: 35,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selected[index] =
                                        !selected.elementAt(index);
                                  });

                                  CartItemBrandName.remove(
                                      CartItemBrandName[index]);
                                  CartItemName.remove(CartItemName[index]);
                                  CartItemPrice.remove(CartItemPrice[index]);
                                  CartItemImage.remove(CartItemImage[index]);
                                },
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 25),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 5, top: 15),
                  child: Text(
                    '\u{20B9} $CheckOutPrice',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    var sharedPref = await SharedPreferences.getInstance();
                    var isLoggedIn = sharedPref.getBool(KEYLOGIN);
                    if (sum == 0) {
                      VxToast.show(
                        context,
                        msg: 'Select At Least one Item',
                        bgColor: Colors.deepPurple[100],
                        textColor: Colors.black,
                        pdHorizontal: 50,
                      );
                    } else {
                      if (isLoggedIn != null) {
                        if (isLoggedIn) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOutPage(
                                        Price: CheckOutPrice,
                                      )));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        }
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      }
                    }
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'CHECKOUT',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
