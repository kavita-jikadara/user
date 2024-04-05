import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/loginUserData.dart';

class EditProfile extends StatefulWidget {
  final detail;
  const EditProfile({super.key, required this.detail});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ApiService apiService = ApiService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController.text = widget.detail['uname'];
    _emailController.text = widget.detail['uemail'];
    _phoneController.text = widget.detail['uphone'];
    _addressController.text = widget.detail['uaddress'];
  }

  void update() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.red),
                labelText: 'Username',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                var userData =
                    Provider.of<LoginUserData>(context, listen: false)
                        .getUserData();
                final formData = FormData.fromMap({
                  'uid': userData['uid'],
                  "from": "update profile",
                  "uname": _usernameController.text,
                  "uemail": _emailController.text,
                  "uphone": _phoneController.text,
                  "uaddress": _addressController.text
                });
                var res =
                    await apiService.postCall("userprofile.php", formData);
                if (res['status'] == true) {
                  final snackBar = SnackBar(
                    content: Text(res['message']),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 3),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
