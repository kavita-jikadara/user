import 'package:flutter/material.dart';
import 'package:swiggy_clone/apiService.dart';

class info_screen extends StatefulWidget {
  const info_screen({super.key, required this.popupItemData});
  final popupItemData;

  @override
  State<info_screen> createState() => _info_screenState();
}

class _info_screenState extends State<info_screen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: widget.popupItemData['pimage'] == ""
                                ? Image.asset(
                                    'assets/images/premium.jpeg',
                                    fit: BoxFit.fill,
                                    height: 200,
                                  )
                                : Image.network(
                                    "${apiService.url}/${widget.popupItemData['pimage']}",
                                    fit: BoxFit.fill,
                                    height: 200,
                                    width: double.infinity,
                                  ),
              // Image.asset('assets/images/premium.jpg',
              //     fit: BoxFit.fill,
              //     height: 200,
              //     width: MediaQuery.of(context).size.width
              // ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.popupItemData['pname']}'),
                    Text('₹ ${widget.popupItemData['price']}'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  color: Color.fromARGB(255, 255, 236, 238),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
