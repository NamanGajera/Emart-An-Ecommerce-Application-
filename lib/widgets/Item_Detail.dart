// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, file_names, must_be_immutable

import 'package:emart/BottomNavPage/Cart.dart';
import 'package:emart/main_pages/LoginPage.dart';
import 'package:emart/widgets/CheckOut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:emart/consts/List.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetail extends StatefulWidget {
  String Iname;
  final String IBrandName;
  final String Iimage;
  final String IRating;
  final String IPrice;

  ItemDetail({
    super.key,
    required this.Iname,
    required this.Iimage,
    required this.IBrandName,
    required this.IRating,
    required this.IPrice,
  });

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  double? _ratingValue;
  int SizedCurrent = 0;
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  select = !select;
                });
                if (favoriteitemName.contains(widget.Iname)) {
                  favoriteitemName.remove(widget.Iname);
                  FavItemImage.remove(widget.Iimage);
                  FavItemBrandName.remove(widget.IBrandName);
                  FavItemPrice.remove(widget.IPrice);
                } else {
                  favoriteitemName.add(widget.Iname);
                  FavItemImage.add(widget.Iimage);
                  FavItemBrandName.add(widget.IBrandName);
                  FavItemPrice.add(widget.IPrice);
                }
              },
              icon: select
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              color: select ? Colors.red : Colors.black,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Cart();
                  }),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            //image of item
            SizedBox(
              height: 300,
              child: Center(
                child: Image.asset(
                  widget.Iimage,
                  height: 300,
                  width: 300,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            // showing details of item
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.topLeft,
                width: double.infinity,
                margin: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(50, 30),
                    topRight: Radius.elliptical(50, 30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    //Brand Name of Item
                    Text(
                      widget.IBrandName,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //NAme Of Item
                    Text(
                      widget.Iname,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //Rating Bar
                    RatingBar(
                      initialRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.orange,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: Colors.orange,
                          )),
                      onRatingUpdate: (value) {
                        setState(() {
                          _ratingValue = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\u{20B9} ${widget.IPrice}',
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Divider(
                      color: Colors.grey[350],
                      indent: 0,
                      endIndent: 0,
                      height: 20,
                    ),
                    const Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // size selector bar
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ClothSize.length,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          SizedCurrent = index;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(5),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          border: SizedCurrent == index
                                              ? Border.all(
                                                  color:
                                                      const Color(0xFF4C53A5),
                                                  width: 1.5,
                                                )
                                              : null,
                                          borderRadius: SizedCurrent == index
                                              ? BorderRadius.circular(15)
                                              : BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(ClothSize[index]),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[350],
                      indent: 0,
                      endIndent: 0,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Free Delivery',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      color: Colors.grey[350],
                      indent: 0,
                      endIndent: 0,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Cash On Delivery',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Spacer(),

                    const SizedBox(height: 2),
                  ],
                ),
              ),
            ),
            // CART & BUY Button
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var sharedPref = await SharedPreferences.getInstance();
                      var isLoggedIn = sharedPref.getBool(CartState.KEYLOGIN);
                      if (isLoggedIn != null) {
                        if (isLoggedIn) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CheckOutPage(
                              Price: widget.IPrice,
                            );
                          }));
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        }
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.grey[350]),
                      child: const Center(
                          child: Text(
                        'BUY NOW',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (CartItemName.contains(widget.Iname)) {
                        CartItemImage.remove(widget.Iimage);
                        CartItemName.remove(widget.Iname);
                        CartItemBrandName.remove(widget.IBrandName);
                        CartItemPrice.remove(widget.IPrice);
                        VxToast.show(
                          context,
                          msg: 'Product Remove To Cart',
                          bgColor: Colors.deepPurple[100],
                          textColor: Colors.black,
                          pdHorizontal: 50,
                        );
                      } else {
                        CartItemImage.add(widget.Iimage);
                        CartItemName.add(widget.Iname);
                        CartItemBrandName.add(widget.IBrandName);
                        CartItemPrice.add(widget.IPrice);
                        VxToast.show(
                          context,
                          msg: 'Product Add To Cart',
                          bgColor: Colors.deepPurple[100],
                          textColor: Colors.black,
                          pdHorizontal: 50,
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.grey[350]),
                      child: const Center(
                          child: Text(
                        'ADD TO CART',
                        style: TextStyle(fontSize: 18),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
