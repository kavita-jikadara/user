import 'package:flutter/material.dart';
import 'package:swiggy_clone/loginUserData.dart';
import 'package:swiggy_clone/loginscreen.dart';
import 'package:provider/provider.dart';
// import 'package:swiggy_clone/categoryscreen.dart';
// import 'package:swiggy_clone/itemdetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginUserData()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home: const login(),
      ),
    );
  }
}
