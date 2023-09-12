// ignore_for_file: file_names, non_constant_identifier_names

import 'package:emart/consts/List.dart';
import 'package:emart/widgets/Item_Detail.dart';
import 'package:flutter/material.dart';

class Clothing extends StatefulWidget {
  const Clothing({super.key});

  @override
  State<Clothing> createState() => ClothingState();
}

class ClothingState extends State<Clothing> {
  int itemcount = ClothItemName.length;

  List<bool> selected = <bool>[];
  @override
  initState() {
    for (var i = 0; i < itemcount; i++) {
      selected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: ClothItemName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 400,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (Context) {
                    return ItemDetail(
                      Iname: ClothItemName[index],
                      Iimage: ClothImages[index],
                      IBrandName: ClothBrandName[index],
                      IRating: Rating[index],
                      IPrice: ColthPrice[index],
                    );
                  }),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  // this column contain item information
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //images of item
                    Center(
                      child: Image.asset(
                        ClothImages[index],
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // brand name of item
                    Center(
                      child: Text(ClothBrandName[index]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // name of item
                    Center(
                      child: Text(
                        ClothItemName[index],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    //rating of item
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 180, 186, 255),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  Rating[index],
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // // price and favorite button
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10, top: 5, bottom: 5, right: 13),
                      child: Row(
                        children: [
                          Text(
                            '\u{20B9}${ColthPrice[index]}',
                            style: const TextStyle(fontSize: 22),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selected[index] = !selected[index];
                              });
                              if (favoriteitemName
                                  .contains(ClothItemName[index])) {
                                favoriteitemName.remove(ClothItemName[index]);
                                FavItemBrandName.remove(ClothBrandName[index]);
                                FavItemImage.remove(ClothImages[index]);
                                FavItemPrice.remove(ColthPrice[index]);
                              } else {
                                favoriteitemName.add(ClothItemName[index]);
                                FavItemBrandName.add(ClothBrandName[index]);
                                FavItemImage.add(ClothImages[index]);
                                FavItemPrice.add(ColthPrice[index]);
                              }
                            },
                            color: selected.elementAt(index)
                                ? Colors.red
                                : Colors.black,
                            icon: selected.elementAt(index)
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
