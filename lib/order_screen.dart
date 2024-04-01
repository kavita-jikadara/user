import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/DiningScreen.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/cupounscreen.dart';
import 'package:swiggy_clone/loginUserData.dart';

class order_screen extends StatefulWidget {
  const order_screen({super.key, required this.orderData});
  final orderData;

  @override
  State<order_screen> createState() => _order_screenState();
}

class _order_screenState extends State<order_screen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(),
                        child: Icon(
                          Icons.keyboard_backspace,
                          size: 30,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        "${widget.orderData['pname']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: widget.orderData['pimage'] == ""
                                        ? Image.asset(
                                            'assets/images/premium.jpeg',
                                            height: 15,
                                          )
                                        : Image.network(
                                            "${apiService.url}/${widget.orderData['pimage']}",
                                            height: 15,
                                          ),
                                    // Image.asset(
                                    //   'assets/images/premium.jpg',
                                    //   height: 15,
                                    // ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      "${widget.orderData['pname']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  // onTap: () {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => home5()));
                                  // },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 8, right: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 218, 208, 208))),
                                    child: Text(
                                      "-   1   +",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  child: Text(
                                    "₹${widget.orderData['price']}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   child: DottedLine(
                      //     dashLength: 1,
                      //     dashColor: Colors.grey,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 20, right: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         child: Text(
                      //           "Write instruction for festaurant",
                      //           style: TextStyle(
                      //             fontSize: 12,
                      //             color: Colors.grey[600],
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         child: Icon(
                      //           Icons.add_circle_outline_sharp,
                      //           color: Colors.grey[600],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(top: 30, left: 10),
                //       child: Text(
                //         "Offer & Benefits",
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => cupoun()));
                //   },
                //   child: Container(
                //     margin: EdgeInsets.only(
                //       left: 10,
                //       top: 20,
                //       right: 10,
                //     ),
                //     padding: EdgeInsets.only(
                //       top: 15,
                //       bottom: 15,
                //       left: 15,
                //       right: 15,
                //     ),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.white,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Container(
                //           child: Text(
                //             "Apply Coupon",
                //             style: TextStyle(fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //         Container(
                //           child: Icon(
                //             Icons.keyboard_arrow_right,
                //             color: Colors.grey,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Tip your Delivery Partner!  ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.info_outline,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 8,
                          right: 34,
                        ),
                        child: Text(
                          "Thank your delivery partner by leaving them a tip 100% of the tip will go to your delivery partner.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 97, 89, 89),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 214, 203, 203))),
                            child: Text(
                              "₹50",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                  top: 4,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 214, 203, 203))),
                                child: Text(
                                  "₹50",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Colors.orange[800],
                                ),
                                child: Text(
                                  "most tipted",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 214, 203, 203))),
                            child: Text(
                              "₹50",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(255, 214, 203, 203))),
                            child: Text(
                              "₹50",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 10,
                      ),
                      child: Text(
                        "Delivery Instruction",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          padding: EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 45),
                                child: Icon(
                                  Icons.notifications_active,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 34),
                                child: Text(
                                  "Avoid",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 102, 98, 98),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "ringing bell",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 102, 98, 98),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: EdgeInsets.only(
                                  top: 20, left: 15, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 50),
                                    child: Icon(
                                      Icons.door_sliding_outlined,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 34),
                                    child: Text(
                                      "leve at",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 102, 98, 98),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 22),
                                    child: Text(
                                      "the door",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 102, 98, 98),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: EdgeInsets.only(
                                  top: 20, right: 15, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 40),
                                    child: Icon(
                                      Icons.mic,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Directon",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 102, 98, 98),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "to reach",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 102, 98, 98),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: EdgeInsets.only(
                                  top: 20, left: 10, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 45),
                                    child: Icon(
                                      Icons.phone_iphone_rounded,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 34),
                                    child: Text(
                                      "Avoid",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 97, 89, 89),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Text(
                                      "caling",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(255, 97, 89, 89),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, right: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 45),
                                      child: Icon(
                                        Icons.security,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Leave with",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 102, 98, 98),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 18),
                                      child: Text(
                                        "Security",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 102, 98, 98),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 10,
                      ),
                      child: Text(
                        "Bill Details",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 235,
                  margin: EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 155),
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("item Total"),
                          ),
                          Container(
                            child: Text("₹${widget.orderData['price']}"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  "Delivery Fee | 2.9 kms",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: 140,
                                child: DottedLine(
                                  dashLength: 2,
                                  dashColor: Color.fromARGB(255, 87, 85, 85),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text("₹0"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Save ₹10 on Delivery fee by ordering above",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "₹50",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   child: DottedLine(),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       child: Text("Delivery Tip"),
                      //     ),
                      //     Container(
                      //       child: Text(
                      //         "Add tip",
                      //         style: TextStyle(
                      //             color: Colors.orange[900], fontSize: 12),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Container(
                      //           child: Text(
                      //             "Delivery Fee | 2.9 kms",
                      //             style: TextStyle(fontSize: 13),
                      //           ),
                      //         ),
                      //         Container(
                      //           width: 150,
                      //           child: DottedLine(
                      //             dashLength: 2,
                      //             dashColor: Color.fromARGB(255, 87, 85, 85),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     Container(
                      //       child: Text("₹50"),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Container(
                        child: DottedLine(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "To Pay",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text("₹${widget.orderData['price']}"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    // height: 150,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        children: [
                          // Container(
                          //   margin: EdgeInsets.only(
                          //     top: 20,
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       Container(
                          //         child: Icon(
                          //           Icons.info,
                          //           color: Colors.red[800],
                          //         ),
                          //       ),
                          //       Container(
                          //         alignment: Alignment.topLeft,
                          //         child: Text(
                          //           "  1 Item(s) unavailable",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15,
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     "Sorry! few items are now out of stock.",
                          //     style: TextStyle(fontSize: 10),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[900],
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                var userData = Provider.of<LoginUserData>(context, listen: false).getUserData();
                                final formData = FormData.fromMap({
                                      'uid':userData['uid'],
                                      'rid': widget.orderData['rid'],
                                      'pid': widget.orderData['pid'],
                                      'quantity': 1,
                                      'amount': widget.orderData['price'],
                                      'discount': 0,
                                      'totalamount': widget.orderData['price'],
                                    });
                                    var res = await apiService.postCall("add_order.php", formData);
                                    if (res['status'] == true) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Dining()),
                                          (route) => false);
                                    }
                              },
                              child: Text("ORDER NOW", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
