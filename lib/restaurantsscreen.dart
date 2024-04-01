import 'package:flutter/material.dart';
class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 20,
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
                prefixIcon: Icon(Icons.arrow_back_ios),
                prefixIconColor: Colors.red,
                suffixIconColor: Colors.grey,
                hintText: 'Search Location',
                suffixIcon: Icon(Icons.close),
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
        ],
      ),
    );
  }
}