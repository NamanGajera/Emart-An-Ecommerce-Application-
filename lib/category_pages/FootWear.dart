// ignore_for_file: prefer_final_fields, file_names

import 'package:emart/consts/List.dart';
import 'package:emart/widgets/Item_Detail.dart';
import 'package:flutter/material.dart';

class FootWear extends StatefulWidget {
  const FootWear({super.key});

  @override
  State<FootWear> createState() => _FootWearState();
}

class _FootWearState extends State<FootWear> {
  @override
  void initState() {
    savefavitem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: FWItemName.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 400,
          ),
          itemBuilder: (context, index) {
            bool isselected = savefavitem.contains(FootWearImages[index]);
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (Context) {
                    return ItemDetail(
                      Iname: FWItemName[index],
                      Iimage: FootWearImages[index],
                      IBrandName: FWBrandName[index],
                      IRating: Rating[index],
                      IPrice: FWPrice[index],
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
                        FootWearImages[index],
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // brand name of item
                    Center(
                      child: Text(FWBrandName[index]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // name of item
                    Center(
                      child: Text(
                        FWItemName[index],
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
                            '\u{20B9}${FWPrice[index]}',
                            style: const TextStyle(fontSize: 22),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              setState(() {
                                if (isselected) {
                                  savefavitem.remove(FootWearImages[index]);
                                } else {
                                  savefavitem.add(FootWearImages[index]);
                                }
                              });
                              if (favoriteitemName
                                  .contains(FWItemName[index])) {
                                favoriteitemName.remove(FWItemName[index]);
                                FavItemBrandName.remove(FWBrandName[index]);
                                FavItemImage.remove(FootWearImages[index]);
                                FavItemPrice.remove(FWPrice[index]);
                              } else {
                                favoriteitemName.add(FWItemName[index]);
                                FavItemBrandName.add(FWBrandName[index]);
                                FavItemImage.add(FootWearImages[index]);
                                FavItemPrice.add(FWPrice[index]);
                              }
                            },
                            color: isselected ? Colors.red : Colors.black,
                            icon: isselected
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
