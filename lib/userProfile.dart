import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/editProfile.dart';
import 'package:swiggy_clone/loginUserData.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        elevation: 0, // Remove app bar shadow
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: Text("Loading...."),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    detail['uname'],
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    detail['uemail'],
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Phone',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    detail['uphone'],
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    detail['uaddress'],
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(detail: detail),
                        ),
                      );
                    },
                    child: Text('Edit Profile'),
                  ),
                ],
              ),
            ),
    );
  }
}
