import 'package:flutter/material.dart';

class signupp extends StatefulWidget {
  const signupp({super.key});

  @override
  State<signupp> createState() => _signuppState();
}

class _signuppState extends State<signupp> {
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_3_outlined),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "enter username";  
                          }
                          else{
                            return null;
                          }
                        },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print("success");
                        username.clear();
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("Sign up")),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
