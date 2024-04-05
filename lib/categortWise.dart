import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/itemdetail.dart';
import 'package:swiggy_clone/profilescreen.dart';
import 'package:swiggy_clone/purevagescreen.dart';

class CategoryWise extends StatefulWidget {
  const CategoryWise({super.key, required this.category});
  final String category;
  @override
  State<CategoryWise> createState() => _CategoryWiseState();
}

class _CategoryWiseState extends State<CategoryWise> {
  ApiService apiService = ApiService();
  List resturant = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getResturant(widget.category);
  }

  getResturant(category) async {
    print('category.php?foodcategory=${category}');
    var res = await apiService.getCall('category.php?foodcategory=${category}');
    setState(() {
      resturant = res['data'];
      isLoading = false;
      log("data $resturant");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Places'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
                    'ALL ${widget.category} PLACES AROUND YOU',
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
            isLoading
                ? Center(
                    child: Text("Loading..."),
                  )
                : resturant.length == 0
                    ? Center(
                        child: Text("No resturants available"),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: resturant.length,
                        itemBuilder: (context, index) {
                          var item = resturant[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                            builder: (context) => itemdetail(
                                                  itemData: item,
                                                )));
                                  },
                                  child: Card(
                                    // child: Padding(
                                    // padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(
                                        left: 15, right: 15),
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
                                                          : Icons
                                                              .favorite_border,
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
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                padding:
                                                    const EdgeInsets.all(3),
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
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 10, 68, 12),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            "${item['resaddress']}",
                                                            style: TextStyle(
                                                                fontSize: 13),
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
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 13),
                                                        ),
                                                        // const Spacer(),
                                                        Text(
                                                          " - ${item['closetime']}",
                                                          style:
                                                              const TextStyle(
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
                                                          style:
                                                              const TextStyle(
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
                          );
                        },
                      )
          ],
        ),
      ),
    );
  }
}
