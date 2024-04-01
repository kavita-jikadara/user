import 'package:flutter/material.dart';
import 'package:swiggy_clone/dishesscreen.dart';
import 'package:swiggy_clone/restaurantsscreen.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.pink,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Restaurant",
                ),
                Tab(
                  text: "Dishes",
                ),
              ],
            ),
            // TabBar

            backgroundColor: Colors.white,
          ), // AppBars
          body: const TabBarView(
            children: [
              Restaurant(),
              Dishes(),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    );
  }
}
