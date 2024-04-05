import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/favouriteList.dart';
import 'package:swiggy_clone/feedback.dart';
import 'package:swiggy_clone/loginUserData.dart';
import 'package:swiggy_clone/loginscreen.dart';
import 'package:swiggy_clone/orderHistory.dart';
import 'package:swiggy_clone/userProfile.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  ApiService apiService = ApiService();
  var detail = {};
  bool isLoading = true;
  getDetails() async {
    var userData =
        Provider.of<LoginUserData>(context, listen: false).getUserData();
    final formData =
        FormData.fromMap({'uid': userData['uid'], "from": "profile"});
    var res = await apiService.postCall("userprofile.php", formData);
    if (res['status'] == true) {
      setState(() {
        detail = res['data'];
        isLoading = false;
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      backgroundColor: Color.fromARGB(255, 236, 234, 234),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BackButton(),
          Padding(padding: EdgeInsets.only(right: 50, left: 50)),
          Card(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isLoading ? "..." : detail['uname'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(isLoading ? "..." : detail['uemail']),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => FavList(),
                      //         ),
                      //       );
                      //     },
                      //     child: Container(
                      //       margin: const EdgeInsets.only(top: 5),
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       child: const Padding(
                      //         padding: EdgeInsets.all(15.0),
                      //         child: Column(
                      //           children: [
                      //             Icon(Icons.favorite_outline),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "Favourites",
                      //               style: TextStyle(fontSize: 20),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfile(),
                            ),
                          );
                        },
                        title: Text("Your Profile"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderHistory(),
                            ),
                          );
                        },
                        title: Text("Your Orders"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.shopping_bag,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      ListTile(
                        title: Text("Your Rating"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login(),
                            ),
                          );
                        },
                        title: Text("Log out"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                    ],
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
