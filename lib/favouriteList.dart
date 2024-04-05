import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/editProfile.dart';
import 'package:swiggy_clone/loginUserData.dart';

class FavList extends StatefulWidget {
  const FavList({super.key});

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
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
        title: Text('Favourite List'),
        elevation: 0, // Remove app bar shadow
      ),
      body: isLoading
          ? Center(
              child: Container(
                child: Text("Loading...."),
              ),
            )
          : Padding(padding: const EdgeInsets.all(16.0), child: Container()),
    );
  }
}
