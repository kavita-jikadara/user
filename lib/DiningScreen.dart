import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/itemdetail.dart';
import 'package:swiggy_clone/profilescreen.dart';
import 'package:swiggy_clone/purevagescreen.dart';

class Dining extends StatefulWidget {
  const Dining({super.key});

  @override
  State<Dining> createState() => _DiningState();
}

class _DiningState extends State<Dining> {
  ApiService apiService = ApiService();
  List resturant = [];

  @override
  void initState() {
    super.initState();
    getResturant();
  }

  getResturant() async {
    var res = await apiService.getCall('restaurant.php');
    setState(() {
      resturant = res['data'];
      log("data $resturant");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profile(),
                    ),
                  );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10,left: 340,top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),               
              ), 
              child: const Icon(Icons.person,color: Colors.blue,size: 30,
              ),            
            ),
          ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 1),
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.red,
                  suffixIconColor: Colors.red,
                  hintText: 'Search Location',
                  suffixIcon: const Icon(Icons.mic_none),
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                              child: const Icon(
                            Icons.tune,
                            size: 20,
                          )),
                          Container(
                            child: const Text(
                              'Filters',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: const Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Delights',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Nearest',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Book Table',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Rating 4.0+',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Pure Veg',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Outdoor Seating',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Open Now',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Cafe`S',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Fine Dining',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: const Text(
                              'Rating',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: const Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: 0.3,
                            blurRadius: 0.1,
                            color: Colors.grey,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: const Text(
                              'Cost',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: const Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Text(
                          'WHAT  ARE  YOU  LOOKING  FOR?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const pure_veg(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 93,
                                width: 111,
                                margin: const EdgeInsets.only(
                                    right: 10), // Spacing between images
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.asset(
                                    'assets/images/pure_veg.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 93,
                              width: 112,
                              margin: const EdgeInsets.only(
                                  right: 10), // Spacing between images
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.asset(
                                  'assets/images/buffet-services.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            Container(
                              height: 93,
                              width: 113,
                              // Spacing between images
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.asset(
                                  'assets/images/premium1.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            // Add more Container widgets with ClipRRect and Image.asset for additional images
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 33),
                        child: Row(
                          children: [
                            const Text(
                              "Pure Veg",
                              style: TextStyle(
                                color: Color.fromARGB(255, 69, 68, 68),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 80), // Spacing between texts
                            const Text(
                              "Buffet",
                              style: TextStyle(
                                color: Color.fromARGB(255, 69, 68, 68),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            // SizedBox(width: 51.10), // Spacing between texts
                            Container(
                              margin: const EdgeInsets.only(left: 57.63),
                              child: const Text(
                                "Premium Place",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 69, 68, 68),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            // Add more Text widgets with SizedBox for additional texts
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            Container(
                              height: 93,
                              width: 111,
                              margin: const EdgeInsets.only(
                                  right: 10), // Spacing between images
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.asset(
                                  'assets/images/dessert.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              height: 93,
                              width: 112,
                              margin: const EdgeInsets.only(
                                  right: 10), // Spacing between images
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.asset(
                                  'assets/images/coffee.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            Container(
                              height: 93,
                              width: 113,
                              // Spacing between images
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Image.asset(
                                  'assets/images/familyd.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            // Add more Container widgets with ClipRRect and Image.asset for additional images
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          children: [
                            const Text(
                              "Desserts",
                              style: TextStyle(
                                color: Color.fromARGB(255, 69, 68, 68),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 80), // Spacing between texts
                            const Text(
                              "Cafe",
                              style: TextStyle(
                                color: Color.fromARGB(255, 69, 68, 68),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            // SizedBox(width: 51.10), // Spacing between texts
                            Container(
                              margin: const EdgeInsets.only(left: 63.93),
                              child: const Text(
                                "Family Dining",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 69, 68, 68),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            // Add more Text widgets with SizedBox for additional texts
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Text(
                          'MUST-TRIES  IN  SURAT',
                          style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 185,
                              width: 165,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Stack(
                                  children: [
                                    Container(
                                        height: 185,
                                        width: 165,
                                        child: Image.asset(
                                          'assets/images/gujarati1.jpg',
                                          fit: BoxFit.fill,
                                        )),
                                    const Positioned(
                                        left: 5,
                                        bottom: 9,
                                        child: Text(
                                          "13 Unmissable \n Gujarati \n Delicacies",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Container(
                              height: 185,
                              width: 165,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 185,
                                      width: 165,
                                      child: Image.asset(
                                        'assets/images/greate.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Positioned(
                                        left: 5,
                                        bottom: 9,
                                        child: Text(
                                          "11 Great Cafes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 241, 241, 241)),
                              color: const Color.fromARGB(255, 244, 240, 240)),
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 3.5, top: 3.5),
                          child: const Row(
                            children: [
                              Text(
                                "Explore more",
                                style: TextStyle(color: Colors.red),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Text(
                          "POPULAR  RESTAURANTS  AROUND \n                            YOU",
                          style: TextStyle(
                              color: Color.fromARGB(255, 100, 100, 100),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  for (var item in resturant)
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => itemdetail(itemData: item,)));
                          },
                          child: Card(
                            // child: Padding(
                            // padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              height: 260,
                              // width: 165,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 199,
                                      width: double.infinity,
                                      child: item['resimage'] == ""
                                          ? Image.asset(
                                              'assets/images/greate.jpg',
                                              fit: BoxFit.fill,
                                            )
                                          : Image.network(
                                              "${apiService.url}/${item['resimage']}",
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      right: 7,
                                      top: 7,
                                      child: Container(
                                        child: LikeButton(
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              isLiked
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isLiked
                                                  ? Colors.pink
                                                  : Colors.black,
                                              size: isLiked ? 25 : 25,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 7,
                                      top: 165,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Center(
                                          child: Text(
                                            "${item['resname']}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0.5,
                                      left: 5,
                                      right: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_pin,
                                                  size: 15,
                                                  color: const Color.fromARGB(
                                                      255, 10, 68, 12),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "${item['resaddress']}",
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                    "₹${item['minamount']} for two"),
                                              ],
                                            ),
                                            // const Text(
                                            //   "(Jubilee chowk)",
                                            //   style: TextStyle(
                                            //     fontWeight: FontWeight.bold,
                                            //     fontSize: 16,
                                            //   ),
                                            // ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.alarm_sharp,
                                                  size: 15,
                                                  color: Color.fromARGB(
                                                      255, 55, 119, 57),
                                                ),
                                                Text(
                                                  "${item['opentime']}",
                                                  style: const TextStyle(
                                                      fontSize: 13),
                                                ),
                                                // const Spacer(),
                                                Text(
                                                  " - ${item['closetime']}",
                                                  style: const TextStyle(
                                                      fontSize: 13),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.phone_outlined,
                                                  size: 15,
                                                  color: Color.fromARGB(
                                                      255, 55, 119, 57),
                                                ),
                                                Text(
                                                  " ${item['resphone']}",
                                                  style: const TextStyle(
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ), // Add other text widgets or elements here
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
