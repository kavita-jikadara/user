import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/loginUserData.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.rid});
  final rid;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class Review {
  final double rating;
  final String review;
  final String username;

  Review({
    required this.rating,
    required this.review,
    required this.username,
  });
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  ApiService apiService = ApiService();
  double _userRating = 3.0;
  TextEditingController _reviewController = TextEditingController();

  var reviews = [];
  bool isLoading = true;
  getDetails() async {
    var userData =
        Provider.of<LoginUserData>(context, listen: false).getUserData();
    final formData = FormData.fromMap({'rid': widget.rid});
    var res = await apiService.postCall("review.php", formData);
    if (res['status'] == true) {
      setState(() {
        reviews = res['data'];
        print(reviews);
        isLoading = false;
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resturant Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate this resturant:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RatingBar.builder(
                initialRating: _userRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _userRating = rating;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Write your review:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _reviewController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Share your thoughts...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final userReview = _reviewController.text;
                  print(userReview.length);
                  if (userReview.length > 0) {
                    var userData =
                        Provider.of<LoginUserData>(context, listen: false)
                            .getUserData();
                    final formData = FormData.fromMap({
                      'uid': userData['uid'],
                      'rid': widget.rid,
                      'rating': _userRating,
                      'review': userReview
                    });
                    var res =
                        await apiService.postCall("add_review.php", formData);
                    if (res['status'] == true) {
                      final snackBar = SnackBar(
                        content: Text(res['message']),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    }
                  } else {
                    popup("Please enter review.");
                  }
                },
                child: Text('Submit Review'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              isLoading
                  ? Center(
                      child: Container(
                        child: Text("Loading...."),
                      ),
                    )
                  : ListView.builder(
                      itemCount: reviews.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return ListTile(
                          title: Text(review['uname']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBarIndicator(
                                rating: double.parse(review['rating']),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                              ),
                              const SizedBox(height: 8),
                              Text(review['review']),
                            ],
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future popup(message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
