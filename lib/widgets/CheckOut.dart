// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable

import 'dart:async';

import 'package:emart/consts/List.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutPage extends StatefulWidget {
  final String? Price;
  CheckOutPage({super.key, required this.Price});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int ProductPrice = int.parse(widget.Price!);
    int total = ProductPrice + 49;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 233, 232, 232),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'CHECKOUT',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: (MediaQuery.of(context).size.height) -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '\t\t\tFull Name*',
                            fillColor: Colors.white38,
                            filled: true,
                          ),
                          validator: MultiValidator(
                              [RequiredValidator(errorText: 'Fill The Name')]),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '\t\t\tPhone Number*',
                            fillColor: Colors.white38,
                            filled: true,
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Fill The Name'),
                            LengthRangeValidator(
                                min: 10,
                                max: 10,
                                errorText: 'Enter Valid Number'),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '\t\t\tPin Code*',
                            fillColor: Colors.white38,
                            filled: true,
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Fill The Name'),
                            LengthRangeValidator(
                                min: 6,
                                max: 6,
                                errorText: 'Enter Valid Number'),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '\t\t\tState*',
                            fillColor: Colors.white38,
                            filled: true,
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Fill The State Name'),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '\t\t\tCity*',
                            fillColor: Colors.white38,
                            filled: true,
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Fill The City Name'),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '\t\t\tArea*',
                            fillColor: Colors.white38,
                            filled: true,
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Fill The Area Name'),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: '\t\t\tHouse Number (optional)',
                            fillColor: Colors.white38,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 30,
                  thickness: 1,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      const Text(
                        '\t\t\tProducts Price',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      if (widget.Price == null)
                        const Text('0', style: TextStyle(fontSize: 18)),
                      Text(
                        '\u{20B9} ${widget.Price}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 25),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: const [
                      Text(
                        '\t\t\tDelivery Charge',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        '\u{20B9} 49',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 25),
                    ],
                  ),
                ),
                const Divider(color: Colors.white, thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      const Text(
                        '\t\t\tTotal',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        '\u{20B9} $total ',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 25),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      VxToast.show(
                        context,
                        msg: 'Your Order Placed',
                        bgColor: Colors.deepPurple[100],
                        textColor: Colors.black,
                        pdHorizontal: 50,
                      );
                      int itemcount = CartItemName.length;
                      for (int i = 0; i < itemcount; i++) {
                        HistoryItemImage.add(CartItemImage[i]);
                        HistoryItemName.add(CartItemName[i]);
                        HistoryItemBrandName.add(CartItemBrandName[i]);
                        HistoryItemPrice.add(CartItemPrice[i]);
                        var now = DateTime.now();
                        var formatter = DateFormat.yMd().add_jm();
                        String formattedDate = formatter.format(now);
                        HistoryItemDate.add(formattedDate);
                      }
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white38),
                      child: const Text(
                        'PLACE ORDER',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
