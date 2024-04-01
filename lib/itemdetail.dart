// import 'dart:ffi';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:like_button/like_button.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/info_screen.dart';
import 'package:swiggy_clone/order_screen.dart';
// import 'package:dotted_line/dotted_line.dart';

class itemdetail extends StatefulWidget {
  const itemdetail({super.key, required this.itemData});
  final itemData;

  @override
  State<itemdetail> createState() => _itemdetailState();
}

class _itemdetailState extends State<itemdetail> {
  ApiService apiService = ApiService();
  List productData = [];

  bool Add = false;
  void _openbottomsheet(data) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 20,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (ctx) => info_screen(popupItemData: data,),
    );
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    log("${widget.itemData}");

    var resData = widget.itemData;
    final formData = FormData.fromMap({
      'rid': resData['resid'],
    });

    var res = await apiService.postCall('getAllProductData.php', formData);
    if (mounted) {
      setState(() {
        productData = res['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 25,
          ),
          SizedBox(
            width: 7,
          ),
          Icon(Icons.favorite_outline_rounded, size: 25),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.more_vert, size: 25),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.itemData['resname']}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.eco,
                color: Colors.green,
                size: 20,
              ),
              Text(
                "${widget.itemData['foodcategory']}",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "4.1★",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("4k ratings"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text(
                        "Rastrant Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: LikeButton(
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.pink : Colors.black,
                            size: isLiked ? 25 : 25,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Container(
                  child: Text(
                    'Address:- ${widget.itemData['resaddress']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const Divider(),
                Container(
                  child: Text(
                    "Phone:- ${widget.itemData['resphone']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                const Divider(),
                Container(
                  child: Text(
                    "Open Time:- ${widget.itemData['opentime']}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "Close Time:- ${widget.itemData['closetime']}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(productData.length, (index) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.green),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    top: 5,
                                    left: 5,
                                    right: 5,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.orange[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'BestSeller',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text('${productData[index]['pname']}'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                              ),
                              Container(
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                              ),
                              Container(
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                              ),
                              Container(
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                              ),
                              Container(
                                child: const Icon(
                                  Icons.star_border_purple500_outlined,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '600',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: ' rating'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            "₹ ${productData[index]['price']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _openbottomsheet(productData[index]);
                          },
                          child: Container(
                            height: 130,
                            width: 130,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: productData[index]['pimage'] == ""
                                ? Image.asset(
                                    'assets/images/premium.jpeg',
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    "${apiService.url}/${productData[index]['pimage']}",
                                    fit: BoxFit.fill,
                                  ),
                              // Image.asset(
                              //   'assets/images/premium.jpg',
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => order_screen(orderData: productData[index]),
                              ),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              color: const Color.fromARGB(255, 255, 236, 238),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Add',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.grey,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                const SizedBox(height: 15),
              ],
            );
          }),
            
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               child: Stack(
          //                 children: [
          //                   Container(
          //                     height: 20,
          //                     width: 20,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5),
          //                       border: Border.all(color: Colors.green),
          //                     ),
          //                   ),
          //                   Positioned(
          //                     bottom: 5,
          //                     top: 5,
          //                     left: 5,
          //                     right: 5,
          //                     child: Container(
          //                       height: 10,
          //                       width: 10,
          //                       decoration: BoxDecoration(
          //                         color: Colors.green,
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 5,
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(5),
          //               decoration: BoxDecoration(
          //                 color: Colors.orange[300],
          //                 borderRadius: BorderRadius.circular(5),
          //               ),
          //               child: const Text(
          //                 'BestSeller',
          //                 style: TextStyle(
          //                   fontSize: 10,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text('Pizza'),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: Row(
          //             children: [
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star_border_purple500_outlined,
          //                   color: Colors.grey,
          //                   size: 15,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 5,
          //               ),
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: '600',
          //                       style: TextStyle(fontWeight: FontWeight.bold),
          //                     ),
          //                     TextSpan(text: ' rating'),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text(
          //             "₹ 200",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             _openbottomsheet();
          //           },
          //           child: Container(
          //             height: 130,
          //             width: 130,
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(20),
          //               child: Image.asset(
          //                 'assets/images/premium.jpg',
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 2,
          //         ),
          //         Container(
          //           height: 35,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.red),
          //             color: const Color.fromARGB(255, 255, 236, 238),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Center(
          //             child: Text(
          //               'Add',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 15),
          // const DottedLine(
          //   direction: Axis.horizontal,
          //   alignment: WrapAlignment.center,
          //   lineLength: double.infinity,
          //   lineThickness: 1.0,
          //   dashLength: 4.0,
          //   dashColor: Colors.grey,
          //   dashRadius: 0.0,
          //   dashGapLength: 4.0,
          //   dashGapColor: Colors.transparent,
          //   dashGapRadius: 0.0,
          // ),
          // const SizedBox(height: 15),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               child: Stack(
          //                 children: [
          //                   Container(
          //                     height: 20,
          //                     width: 20,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5),
          //                       border: Border.all(color: Colors.green),
          //                     ),
          //                   ),
          //                   Positioned(
          //                     bottom: 5,
          //                     top: 5,
          //                     left: 5,
          //                     right: 5,
          //                     child: Container(
          //                       height: 10,
          //                       width: 10,
          //                       decoration: BoxDecoration(
          //                         color: Colors.green,
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 5,
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(5),
          //               decoration: BoxDecoration(
          //                 color: Colors.orange[300],
          //                 borderRadius: BorderRadius.circular(5),
          //               ),
          //               child: const Text(
          //                 'BestSeller',
          //                 style: TextStyle(
          //                   fontSize: 10,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text('Pizza'),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: Row(
          //             children: [
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star_border_purple500_outlined,
          //                   color: Colors.grey,
          //                   size: 15,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 5,
          //               ),
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: '600',
          //                       style: TextStyle(fontWeight: FontWeight.bold),
          //                     ),
          //                     TextSpan(text: ' rating'),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text(
          //             "₹ 200",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             _openbottomsheet();
          //           },
          //           child: Container(
          //             height: 130,
          //             width: 130,
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(20),
          //               child: Image.asset(
          //                 'assets/images/premium.jpg',
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 2,
          //         ),
          //         Container(
          //           height: 35,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.red),
          //             color: const Color.fromARGB(255, 255, 236, 238),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Center(
          //             child: Text(
          //               'Add',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 15),
          // const DottedLine(
          //   direction: Axis.horizontal,
          //   alignment: WrapAlignment.center,
          //   lineLength: double.infinity,
          //   lineThickness: 1.0,
          //   dashLength: 4.0,
          //   dashColor: Colors.grey,
          //   dashRadius: 0.0,
          //   dashGapLength: 4.0,
          //   dashGapColor: Colors.transparent,
          //   dashGapRadius: 0.0,
          // ),
          // const SizedBox(height: 15),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               child: Stack(
          //                 children: [
          //                   Container(
          //                     height: 20,
          //                     width: 20,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5),
          //                       border: Border.all(color: Colors.green),
          //                     ),
          //                   ),
          //                   Positioned(
          //                     bottom: 5,
          //                     top: 5,
          //                     left: 5,
          //                     right: 5,
          //                     child: Container(
          //                       height: 10,
          //                       width: 10,
          //                       decoration: BoxDecoration(
          //                         color: Colors.green,
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 5,
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(5),
          //               decoration: BoxDecoration(
          //                 color: Colors.orange[300],
          //                 borderRadius: BorderRadius.circular(5),
          //               ),
          //               child: const Text(
          //                 'BestSeller',
          //                 style: TextStyle(
          //                   fontSize: 10,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text('Pizza'),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: Row(
          //             children: [
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star_border_purple500_outlined,
          //                   color: Colors.grey,
          //                   size: 15,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 5,
          //               ),
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: '600',
          //                       style: TextStyle(fontWeight: FontWeight.bold),
          //                     ),
          //                     TextSpan(text: ' rating'),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text(
          //             "₹ 200",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             _openbottomsheet();
          //           },
          //           child: Container(
          //             height: 130,
          //             width: 130,
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(20),
          //               child: Image.asset(
          //                 'assets/images/premium.jpg',
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 2,
          //         ),
          //         Container(
          //           height: 35,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.red),
          //             color: const Color.fromARGB(255, 255, 236, 238),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Center(
          //             child: Text(
          //               'Add',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 15),
          // const DottedLine(
          //   direction: Axis.horizontal,
          //   alignment: WrapAlignment.center,
          //   lineLength: double.infinity,
          //   lineThickness: 1.0,
          //   dashLength: 4.0,
          //   dashColor: Colors.grey,
          //   dashRadius: 0.0,
          //   dashGapLength: 4.0,
          //   dashGapColor: Colors.transparent,
          //   dashGapRadius: 0.0,
          // ),
          // const SizedBox(height: 15),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               child: Stack(
          //                 children: [
          //                   Container(
          //                     height: 20,
          //                     width: 20,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5),
          //                       border: Border.all(color: Colors.green),
          //                     ),
          //                   ),
          //                   Positioned(
          //                     bottom: 5,
          //                     top: 5,
          //                     left: 5,
          //                     right: 5,
          //                     child: Container(
          //                       height: 10,
          //                       width: 10,
          //                       decoration: BoxDecoration(
          //                         color: Colors.green,
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 5,
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(5),
          //               decoration: BoxDecoration(
          //                 color: Colors.orange[300],
          //                 borderRadius: BorderRadius.circular(5),
          //               ),
          //               child: const Text(
          //                 'BestSeller',
          //                 style: TextStyle(
          //                   fontSize: 10,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text('Pizza'),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: Row(
          //             children: [
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star,
          //                   color: Colors.orange,
          //                   size: 15,
          //                 ),
          //               ),
          //               Container(
          //                 child: const Icon(
          //                   Icons.star_border_purple500_outlined,
          //                   color: Colors.grey,
          //                   size: 15,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 5,
          //               ),
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: '600',
          //                       style: TextStyle(fontWeight: FontWeight.bold),
          //                     ),
          //                     TextSpan(text: ' rating'),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           child: const Text(
          //             "₹ 200",
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             _openbottomsheet();
          //           },
          //           child: Container(
          //             height: 130,
          //             width: 130,
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(20),
          //               child: Image.asset(
          //                 'assets/images/premium.jpg',
          //                 fit: BoxFit.fill,
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 2,
          //         ),
          //         Container(
          //           height: 35,
          //           width: 100,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: Colors.red),
          //             color: const Color.fromARGB(255, 255, 236, 238),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Center(
          //             child: Text(
          //               'Add',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 15),
          // const DottedLine(
          //   direction: Axis.horizontal,
          //   alignment: WrapAlignment.center,
          //   lineLength: double.infinity,
          //   lineThickness: 1.0,
          //   dashLength: 4.0,
          //   dashColor: Colors.grey,
          //   dashRadius: 0.0,
          //   dashGapLength: 4.0,
          //   dashGapColor: Colors.transparent,
          //   dashGapRadius: 0.0,
          // ),
          // const SizedBox(height: 15),
        ],
      ),
      // if (Add)
      //   Positioned(
      //     bottom: 10,
      //     left: 0,
      //     right: 0,
      //     child: GestureDetector(
      //       onTap: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => order_screen()));
      //       },
      //       child: Column(
      //         children: [
      //           Container(
      //             padding: EdgeInsets.all(10),
      //             margin: EdgeInsets.only(left: 10, right: 10, top: 200),
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(10),
      //                 color: Colors.green[300]),
      //             child: Row(
      //               children: [
      //                 Container(
      //                   child: Column(
      //                     children: [
      //                       Container(
      //                         margin: EdgeInsets.only(right: 15),
      //                         child: Text(
      //                           "1 item | ₹450",
      //                           style: TextStyle(
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         margin: EdgeInsets.only(left: 10),
      //                         child: Text(
      //                           "Extra charges may apply",
      //                           style: TextStyle(
      //                             fontSize: 10,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                   margin: EdgeInsets.only(left: 130),
      //                   child: Text(
      //                     "View Cart",
      //                     style: TextStyle(
      //                       fontSize: 15,
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}
