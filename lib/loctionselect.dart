import 'package:flutter/material.dart';
import 'package:swiggy_clone/categoryscreen.dart';

import 'homescreen.dart';
// import 'package:swiggy_clone/homescreen.dart';
// import 'package:swiggy_clone/locationscreen.dart';

class select_location extends StatefulWidget {
  const select_location({super.key});

  @override
  State<select_location> createState() => _select_locationState();
}

class _select_locationState extends State<select_location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(),
          Container(),
          Text(
            "We don't have your location,yet!",
            style: TextStyle(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Set your location to start exporing \n restaurants near you",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12,
          ),
         
          
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(left: 17, right: 17),
            child: ElevatedButton(
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => home(),
                    ),
                  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on, // Choose your desired icon
                    color: Colors.white,
                    size: 24, // Adjust the size of the icon
                  ),
                  SizedBox(width: 8), // Adjust spacing between icon and text
                  Text(
                    "Enable device location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
           Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(left: 17, right: 17),
            child: ElevatedButton(
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Category(),
                    ),
                  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on, // Choose your desired icon
                    color: Colors.white,
                    size: 24, // Adjust the size of the icon
                  ),
                  SizedBox(width: 8), // Adjust spacing between icon and text
                  Text(
                    "Enable device location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
                child: Text(
              "We only access your location while you are using  the app to improve your exprience.",
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),
    );
  }
}
