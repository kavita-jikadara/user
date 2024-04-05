import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/DiningScreen.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/forgotPassword.dart';
import 'package:swiggy_clone/homescreen.dart';
import 'package:swiggy_clone/loginUserData.dart';
import 'package:swiggy_clone/logotscreen.dart';
import 'package:swiggy_clone/signup.dart';
import 'package:swiggy_clone/signupscreen.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {
  ApiService apiService = ApiService();

  late Animation animation;
  late AnimationController animationController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool click = true;
  bool onclick = true;
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut),
    );
    animationController.forward();
  }

  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Artboard2.jpg"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: Colors.white,
                          ),
                          transform: Matrix4.translationValues(
                              animation.value * width, 0, 0),
                          // margin: EdgeInsets.only(top: 50, left: 100, right: 100),
                          child: Center(
                            child: Text(
                              "LETS NOW",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 35,
                                  color: Colors.orange[700]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          height: 550,
                          transform: Matrix4.translationValues(
                              animation.value * width, 0, 0),
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: const Offset(4, 6),
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: ListView(
                            children: [
                              TextFormField(
                                //  maxLength: 30,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: "Email",
                                  prefixIcon: const Icon(
                                    Icons.email_rounded,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                                controller: email,
                                validator: (value) {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value ?? "");
                                  if (emailValid == true) {
                                    return null;
                                  } else {
                                    return "Require* email";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // maxLength: 10,
                                keyboardType: TextInputType.number,
                                obscureText: !click,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        click = !click;
                                      });
                                    },
                                    child: click
                                        ? const Icon(Icons.visibility)
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          ),
                                  ),
                                  hintText: "password",
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                controller: phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter password";
                                  } else if (value!.length < 8) {
                                    return "minimum 8 degit";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 40,
                                margin: const EdgeInsets.only(
                                    left: 10, right: 10, top: 30),
                                width: MediaQuery.of(context).size.width - 30,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      // print("success");
                                      final formData = FormData.fromMap({
                                        'user_name': email.text,
                                        'password': phone.text,
                                      });
                                      var res = await apiService.postCall(
                                          "user_login.php", formData);
                                      if (res['status'] == true) {
                                        Provider.of<LoginUserData>(context,
                                                listen: false)
                                            .setUserData(res['data']);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Dining()),
                                            (route) => false);
                                      } else {
                                        final snackBar = SnackBar(
                                          content: Text(res['message']),
                                          backgroundColor: Colors
                                              .red, // Customize the background color
                                          duration: Duration(
                                              seconds:
                                                  3), // Adjust the duration the SnackBar is displayed
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    } else {
                                      print("hey");
                                    }
                                  },
                                  child: Text('Login'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange[700],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPasswordPage(),
                                          ),
                                        );
                                      },
                                      child: Text("Forgot Password ?")),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // transform: Matrix4.translationValues(
                                    //     animation.value * width, 0, 0),
                                    child: const Text("Don't have an account?"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const singup(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding:
                                          MediaQuery.of(context).viewInsets *
                                              10,
                                      // transform: Matrix4.translationValues(
                                      //     animation.value * width, 0, 0),
                                      child: Text(
                                        "sing up",
                                        style: TextStyle(
                                            color: Colors.orange[700],
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) => const Logout(),
                        //           ),
                        //         );
                        //       },
                        //       child: Container(
                        //         transform: Matrix4.translationValues(
                        //             animation.value * width, 0, 0),
                        //         margin: const EdgeInsets.all(30),
                        //         padding: const EdgeInsets.all(15),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(50),
                        //           color: Colors.orange[700],
                        //         ),
                        //         child: const Icon(
                        //           Icons.arrow_forward_ios,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
