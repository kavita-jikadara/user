import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class cupoun extends StatefulWidget {
  const cupoun({super.key});

  @override
  State<cupoun> createState() => _cupounState();
}

class _cupounState extends State<cupoun> {
  bool more = false;
  bool Other = false;
  bool hp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromARGB(255, 255, 255, 255)),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 15),
                        child: Icon(
                          Icons.west,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "APPLY COUPON",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25),
                            child: Text(
                              "Your Cart: ₹50.60",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Enter Coupon Code',
                      suffixText: "APPLY",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        top: 15,
                      ),
                      child: Text(
                        "Great deal you're mising out on!",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15),
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 30,
                    right: 30,
                    bottom: 5,
                  ),
                  height: 230,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.5,
                        offset: Offset(1, 1),
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'WELCOME50',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "APPLY",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "add ₹50 more to avail this offer",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "Get 50% off",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: DottedLine(
                          dashColor: Color.fromARGB(255, 194, 191, 191),
                          dashGapLength: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "Use code WELCOME50 & get 50% off on your 1st order above ₹50. Maximum discont: ₹50.",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "Extra flat ₹50 Paytm cashback",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "Pay with Paytm wallet to get an additional cashback of ₹50",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              more = !more;
                            },
                          );
                        },
                        child: Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              (more) ? 'Less' : '+ MORE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (more)
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                      bottom: 15,
                    ),
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Terms and Conditions apply",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Valid only on Thursdays",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Applicable twice per user per month",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Valid only on Kotak Credit & Debit  Cards",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Other T&Cs may apply",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Offer valid till sep29,2022 11:59 PM",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    "More offers",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15),
                  padding:
                      EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 5),
                  height: 190,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.5,
                        offset: Offset(1, 1),
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/download65.jpg',
                                  height: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Text(
                                  'KOTAK125',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "APPLY",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "add ₹50 more to avail this offer",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 190,
                            child: Text(
                              "Get 50% discuont using Kotak bank cards",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: DottedLine(
                          dashColor: Color.fromARGB(255, 194, 191, 191),
                          dashGapLength: 1,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 300,
                              child: Text(
                                "Maximum discuont up to ₹50 on orders above ₹500",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Other = !Other;
                          });
                        },
                        child: Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              (Other) ? 'Less' : '+ MORE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (Other)
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                      bottom: 15,
                    ),
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Terms and Conditions apply",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Valid only on Thursdays",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Applicable twice per user per month",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Valid only on Kotak Credit & Debit  Cards",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Other T&Cs may apply",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Offer valid till sep29,2022 11:59 PM",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    "Payment offers",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 15,
                    left: 15,
                    bottom: 10,
                  ),
                  padding:
                      EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 5),
                  height: 120,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.5,
                        offset: Offset(1, 1),
                        color: Colors.grey,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/download64.jpg',
                                  height: 15,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Text(
                                  'Avail 4% Cashback',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "APPLY",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: DottedLine(
                          dashColor: Color.fromARGB(255, 194, 191, 191),
                          dashGapLength: 1,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 300,
                              child: Text(
                                "Maximum discuont up to ₹50 on orders above ₹500",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            hp = !hp;
                          });
                        },
                        child: Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              (hp) ? 'Less' : '+ MORE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (hp)
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 10,
                      right: 10,
                      bottom: 15,
                    ),
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Terms and Conditions apply",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Valid only on Thursdays",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Applicable twice per user per month",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Valid only on Kotak Credit & Debit  Cards",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Other T&Cs may apply",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  "Offer valid till sep29,2022 11:59 PM",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color:
                                          Color.fromARGB(255, 114, 104, 104)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
