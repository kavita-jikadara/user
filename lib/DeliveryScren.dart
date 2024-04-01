// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:swiggy_clone/itemdetail.dart';
import 'package:swiggy_clone/profilescreen.dart';

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.red,
                suffixIconColor: Colors.red,
                hintText: 'Search Location',
                suffixIcon: Icon(Icons.mic_none),
                contentPadding: EdgeInsets.all(15),
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
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
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
                        "WHAT'S  ON  YOUR  MIND?",
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
                    )
                  ],
                ),
               const SizedBox(
                  height: 15,
                ),



                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin:const EdgeInsets.only(left: 10, right: 10, bottom: 5),
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
                                  "Sort",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      const  SizedBox(
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
                          child:const Text(
                            'Jain',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                       const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 35,
                          padding:const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const[
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
                            'Rating 4.0+',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 35,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                spreadRadius: 0.3,
                                blurRadius: 0.1,
                                color: Colors.grey,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Pure Veg',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 35,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                spreadRadius: 0.3,
                                blurRadius: 0.1,
                                color: Colors.grey,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Cuisines',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
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
                        "753 restaurants delivering to you \n                      FEATURED",
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
                const SizedBox(height: 20,),
                // ignore: unused_local_variable
                for(var item in [0,0,0,0,0,0,0,0,0,0,0,0])
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => itemdetail(itemData: item,),),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(left: 15, right: 15,top: 20),
                    child: Container(
                      height: 245,
                      width: 165,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 199,
                                    width: double.infinity,
                                    child: Image.asset(
                                      'assets/images/dhokala.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                              const Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 23,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                top: 115,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Rajdhani Restaurant",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Gujarati ● North India ● Chinese",
                                          style:
                                              TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 58,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.green),
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 5),
                                            child: Text(
                                              "4.0★",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Positioned(
                                bottom: -1,
                                left: 5,
                                right: 5,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [ 
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.alarm,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("35-40 min ● 5 km "),
                                          Spacer(),
                                          Text("\$150 for one"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                right: 10,
                                bottom: 35,
                                child: Container(
                                  height: 35,
                                  width: 324,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 91, 168, 227)),
                                child: Row(
                                  children: [
                                    const Icon(Icons.percent,color: Colors.white,),
                                    const Text("50% OFF up to 100",style: TextStyle(color: Colors.white),),
                                    const SizedBox(width: 100,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text("+1",style: TextStyle(color: Colors.white),),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                  ],
                                ),
                              ))
                            ],
                          )),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
