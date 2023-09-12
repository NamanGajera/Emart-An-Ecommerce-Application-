import 'package:emart/consts/List.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMd().add_jm();
    String formattedDate = formatter.format(now);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Your Order',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: HistoryItemName.length,
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
                              HistoryItemImage[index],
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
                              HistoryItemBrandName[index],
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
                            Flexible(
                              child: Text(
                                HistoryItemName[index],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const Spacer(),
                            //Item Price
                            Text(
                              '\u{20B9} ${HistoryItemPrice[index]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              margin: const EdgeInsets.only(left: 12),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                HistoryItemDate[index],
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
