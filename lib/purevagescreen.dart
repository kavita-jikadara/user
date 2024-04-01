import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:swiggy_clone/aboutresscreen.dart';

// ignore: camel_case_types
class pure_veg extends StatefulWidget {
  const pure_veg({super.key});

  @override
  State<pure_veg> createState() => _pure_vegState();
}

// ignore: camel_case_types
class _pure_vegState extends State<pure_veg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
        "Pure Veg",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      )),
      body: Column(
        children: [
          const SizedBox(
            height: 0,
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
                      'ALL PURE VEG PLACES AROUND YOU',
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
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => about())));
                },
                child: Card(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 220,
                    width: 165,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/greate.jpg',
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
                                isLiked ? Icons.favorite : Icons.favorite_border,
                                color: isLiked ? Colors.pink : Colors.white,
                                size: isLiked ? 25 : 25,
                              );
                            },
                          ),
                                )
                                ),
                              
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            child: Container(
                              height: 70,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2,right: 2),
                                child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Taste of Bhagwati',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              color: Colors.green[900]),
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.symmetric(horizontal: 8),
                                            child: Text(
                                              "4.9*",
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text('New Textile Market,surat',style: TextStyle(fontSize: 12,color: Colors.black,),),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.eco_rounded,
                                          color: Colors.green ,
                                          size: 18,
                                        ),
                                        Text('Pure Veg •',style: TextStyle(color: Colors.green,fontSize: 12),),
                                        Text(' North Indian •',style: TextStyle(color: Colors.black,fontSize: 12),),
                                        Text(' Chinese',style: TextStyle(color: Colors.black,fontSize: 12),),
                                        Spacer(),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text('₹100'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            
                            ),
                          
                          ),
                       
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
