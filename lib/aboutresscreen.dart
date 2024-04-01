import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Taste of Bhagwati',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          LikeButton(
            likeBuilder: (bool isLiked) {
              return Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.pink : Colors.black,
                size: isLiked ? 25 : 25,
              );
            },
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'About the restaurant',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment., // Aligns children horizontally.
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            child: const Icon(
                              Icons.currency_rupee_sharp,
                              size: 17,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '₹ 1,000',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment., // Aligns children horizontally.
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1),
                            margin: const EdgeInsets.all(1),
                            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,border: Border.all(color: Colors.black)),
                            child: const Icon(
                              Icons.room_service_outlined,
                              size: 27,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Serves North Indian,Chinese,Orientials.....',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1),
                            margin: const EdgeInsets.all(1),
                            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,border: Border.all(color: Colors.black)),
                            child: const Icon(
                              Icons.location_on,
                              size: 27,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Silver stone,Near D-mart,Causway, \n Katargam,Surat.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text(
                  'FACILITIES',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 14,
                              width: 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                top: -1,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.done,
                                  size: 14,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "cash on Delivery",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 14,
                              width: 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                top: -1,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.done,
                                  size: 14,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "cash on Delivery",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 14,
                              width: 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                top: -1,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.done,
                                  size: 14,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "cash on Delivery",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 14,
                              width: 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                top: -1,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.done,
                                  size: 14,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "cash on Delivery",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 14,
                              width: 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                top: -1,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.done,
                                  size: 14,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "cash on Delivery",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 14,
                              width: 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                top: -1,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.done,
                                  size: 14,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "cash on Delivery",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'PHOTOS',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      // padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 130,
                                width: 115,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    'assets/images/gujarati1.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 85),
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 115,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.asset(
                                        'assets/images/gujarati1.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 80),
                                    child: Text(
                                      "Food",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'MENU',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 115,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              'assets/images/gujarati1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                       const Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Text(
                            "Food Menu",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Column(
                      children: [
                        Container(
                          height: 130,
                          width: 115,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              'assets/images/gujarati1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                       const Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Text(
                            "Beverages",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'REVIEWS',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Icon(Icons.edit_square ,color: Colors.red,size: 14,),
                    Text("Add Review",style: TextStyle(color: Colors.red,fontSize: 12,),)
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
