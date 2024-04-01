import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/loginscreen.dart';
import 'package:swiggy_clone/logotscreen.dart';

class singup extends StatefulWidget {
  const singup({super.key});

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> with SingleTickerProviderStateMixin {

  ApiService apiService = ApiService();

  late Animation animation;
  late AnimationController animationController;
  final _formfield = GlobalKey<FormState>();

  bool click = true;
  bool onclick = true;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conform_password = TextEditingController();

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
              image: AssetImage("assets/images/Artboard1.jpg"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formfield,
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
                              "SIGN UP",
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
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                   errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: "User Name",
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                                controller: username,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter username";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
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
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                   errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  counterText: '',
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: "Phone",
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(40)),
                                ),
                                controller: phone,
                                validator: (value) {
                                  if (value == "") {
                                    return "Enter phone";
                                  } else if (value!.length < 10) {
                                    return 'minimum 10 digit';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                     errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                    counterText: '',
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    hintText: "Address",
                                    prefixIcon: const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                  controller: address,
                                  validator: (value) {
                                    if (value == "") {
                                      return "Enter address";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
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
                                controller: password,
                                validator: (value) {
                                  if (value == "") {
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
                              TextFormField(
                                obscureText: !onclick,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                   errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: "Confirm Password",
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        onclick = !onclick;
                                      });
                                    },
                                    child: onclick
                                        ? const Icon(Icons.visibility)
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          ),
                                  ),
                                ),
                                controller: conform_password,
                                validator: (value) {
                                  if (value == "") {
                                    return "Enter conform password";
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
                              InkWell(
                                onTap: () async{
                                  if (_formfield.currentState!.validate()) {
                                    // print("success");
                                    final formData = FormData.fromMap({
                                      'uname': username.text,
                                      'uemail': email.text,
                                      'uphone': phone.text,
                                      'uaddress': address.text,
                                      'pwd': password.text,
                                    });
                                     var res = await apiService.postCall("add_user.php", formData);
                                     
                                    if(res['status'] == true){
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login()), (route) => false);
                                    }
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 30),
                                  width: MediaQuery.of(context).size.width - 30,
                                  child: ElevatedButton(
                                    onPressed: () async {},
                                    child: Text('submit'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange[700],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
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
                                    child:
                                        const Text("Already have an account?"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const login(),
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
                                        "Sing In",
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Logout(),
                                  ),
                                );
                              },
                              child: Container(
                                transform: Matrix4.translationValues(
                                    animation.value * width, 0, 0),
                                margin: const EdgeInsets.all(30),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.orange[700],
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
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
