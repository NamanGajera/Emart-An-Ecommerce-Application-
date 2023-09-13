// ignore_for_file: file_names

import 'package:emart/consts/List.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 232, 232),
        drawer: const Drawer(),
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
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: favoriteitemName.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 400,
              ),
              itemBuilder: (context, index) {
                return Container(
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
                          FavItemImage[index],
                          height: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // brand name of item
                      Center(
                        child: Text(FavItemBrandName[index]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // // name of item
                      Text(
                        favoriteitemName[index],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      // // rating of item
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
                      // // price and fav button
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 5, bottom: 5, right: 13),
                        child: Row(
                          children: [
                            Text(
                              '\u{20B9}${FavItemPrice[index]}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (savefavitem
                                        .contains(FavItemImage[index])) {
                                      savefavitem.remove(FavItemImage[index]);
                                    }
                                  });
                                  favoriteitemName
                                      .remove(favoriteitemName[index]);
                                  FavItemBrandName.remove(
                                      FavItemBrandName[index]);
                                  FavItemImage.remove(FavItemImage[index]);
                                  FavItemPrice.remove(FavItemPrice[index]);
                                },
                                color: Colors.red,
                                icon: const Icon(Icons.favorite)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
